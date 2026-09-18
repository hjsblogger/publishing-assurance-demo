# Demo Runbook: Fernwood Press Agentic Assurance & Evidence

Repo: https://github.com/hjsblogger/publishing-assurance-demo
App under test: Fernwood Press, a synthetic self-publishing platform in `website/` (Flask, `http://127.0.0.1:5050`, started by the runner itself)

**The pitch in one line:** most pipelines say "tests passed". This one says *which requirements are proven, by which run, with screenshots to back it*, and no test code was hand-written.

```
requirements/book-publishing-website.md   (REQ-01 .. REQ-09)
   -> context ingest + extract   -> context graph (10 use-cases)
   -> design tests               -> designed *_test.md (35 in .testmuai/tests/)
   -> testrun run                -> ONE sealed .evidence pack (validate --profile L1)
   -> cover gaps                 -> designed x proven ribbon -> PR comment + build gate
```

---

## Part A: One-time setup (do before the demo)

### A1. Get the repo
Clone or fork `hjsblogger/publishing-assurance-demo` into your own GitHub account (secrets and Actions need to be yours).

### A2. Install and log in to kane-cli
```bash
npm install -g @testmuai/kane-cli
kane-cli login --oauth
kane-cli config set-url http://127.0.0.1:5050
```
CI pins the kane-cli version in `.github/actions/setup-kane/action.yml`. Run `kane-cli changelog` before bumping.

### A3. Collect IDs
```bash
kane-cli projects list    # -> TESTMUAI_PROJECT_ID
kane-cli folders list     # -> TESTMUAI_FOLDER_ID
kane-cli config show      # shows the project_id / folder_id bound to your profile
```

### A4. No shopper account needed
Fernwood has no sign-in: identity is the browser session cookie. There are no credentials to register or provision, so `scripts/test_data.py` needs no secrets.

### A5. Add GitHub repo secrets
Settings -> Secrets and variables -> Actions. Four secrets:

| Secret | Source |
|---|---|
| `LT_USERNAME` | TestMu AI / LambdaTest profile |
| `LT_ACCESS_KEY` | TestMu AI / LambdaTest profile |
| `TESTMUAI_PROJECT_ID` | `kane-cli projects list` |
| `TESTMUAI_FOLDER_ID` | `kane-cli folders list` |

```bash
gh secret set LT_USERNAME         --body "<username>"
gh secret set LT_ACCESS_KEY       --body "<access-key>"
gh secret set TESTMUAI_PROJECT_ID --body "<project-id>"
gh secret set TESTMUAI_FOLDER_ID  --body "<folder-id>"
```
The setup action binds project and folder with `kane-cli config project/folder` *after* login. If they are unbound, the run goes green but the pack never reaches Test Manager.

### A6. Dry-run locally (strongly recommended)
```bash
bash scripts/serve_website.sh                       # http://127.0.0.1:5050, waits for /health
REQ_GLOB='requirements/*.md' MAX_PAIRS=6 AUTO_APPROVE=true bash scripts/assurance.sh
python3 scripts/test_data.py provision
find .testmuai/tests -name '*_test.md' | sort > members.txt
python3 scripts/test_data.py check members.txt
kane-cli testrun run $(cat members.txt) --name "Fernwood local" --parallel 1 --headless
```

### A7. Warm the caches
Run the workflow once end to end before the demo. The graph and recorded steps are cached, so the live run replays instead of re-authoring (faster and cheaper).

---

## Part B: Live demo flow

### Step 1. Show the requirements (the source of truth)
Open `requirements/book-publishing-website.md`: nine requirement areas (REQ-01 to REQ-09: navigation, home, packages and seats, submission, tracking/withdrawal, catalog, search, book detail, social proof and support), each with acceptance criteria. Point out nothing downstream is hand-written.

### Step 2. Trigger the pipeline
Push, open a PR touching `requirements/**`, `.testmuai/tests/**` or `website/**`, or run on demand:
```bash
gh workflow run "Fernwood Press · Assurance & Evidence"
```
It also runs on a weekday schedule.

### Step 3. Stage 1, Assurance (requirements -> designed tests)
Commands the pipeline runs (via `scripts/assurance.sh`):
```bash
kane-cli context ingest requirements/*.md --mode ci
kane-cli context extract --mode ci
kane-cli context review --approve <ids> --mode agent
kane-cli design tests --use-case <uc> --mode ci --max 6
kane-cli context fsck
```
Talking points:
- `--mode ci` means "never ask me"; the agent assumes documented defaults.
- Exit code 3 is not a failure. The agent paused on a question, and the session is resumable: `kane-cli context extract --resume <sid> --message "..."`. It shows as a GitHub warning, not a red X.
- The graph is cached. Change one line in the requirements and only that source re-extracts.
- Only undesigned use-cases get designed (`kane-cli cover gaps --stage design`), so nothing is paid for twice.
- Governance option: `AUTO_APPROVE=false` makes use-cases wait for a human `kane-cli context review`.

### Step 4. Stage 2, Evidence (one execution, one sealed pack)
```bash
kane-cli testrun run $(cat members.txt) --dry-run          # preflight
kane-cli testrun run $(cat members.txt) \
  --name "Fernwood regression #42" --parallel 1 --on-failure continue --headless
kane-cli evidence validate .testmuai/evidence/<id>.evidence --profile L1 --json
```
Talking points:
- N tests produce **one** sealed pack, not N loose artifacts.
- Test data comes from `test-data/publishing.json` plus per-run unique manuscript titles and emails. Preflight (`scripts/test_data.py check`) stops the job before any browser starts if a variable is missing.
- `--parallel 1` is deliberate: onboarding seats are one global pool (Starter 6, Standard 4, Premium 2, Author's Choice 1), so parallel members would race for the same seat. Submission tests use Starter and withdraw what they submit.

Open the pack (download the `fernwood-evidence-<run>` artifact):
```bash
kane-cli evidence serve <pack>.evidence
```

**Show it in Test Manager** (test-manager.lambdatest.com): the `publishing-demo` folder lists each designed test as a test run with pass/fail. Open one to show the test instance: duration, browser/OS, attempts, and the step-by-step execution with a screenshot at each step. Screenshots are in `docs/images/`.

Optional local per-test runs (one Test Manager run per test): `bash run-tests.sh [start-index]`. It skips one submission test that hangs.

### Step 5. Stage 3, Coverage (designed x proven)
```bash
# --from goes BEFORE the `gaps` subcommand
PACK=$(find .testmuai/evidence -name '*.evidence' | head -1)
kane-cli cover --from "$PACK" gaps --rollup strict
python3 scripts/coverage_gate.py --json coverage.json --table coverage.txt --threshold 80
```
Show the job summary and the PR comment ribbon. Two axes: **completeness** (designed for every AC?) and **depth** (a test actually ran and passed?). The gate fails the build below `coverage_threshold` (default 80%). A designed test without passing evidence shows as a gap.

### Step 6. Show a failure and diagnose it
A red member is diagnosed from the pack, not the run summary:
```bash
unzip -o <pack>.evidence -d pack/
cat pack/tests/*/failure.yaml        # which step failed, against which AC, what was observed
```
`website.log` is attached to the same artifact for 500s and tracebacks the browser could not see.

### Step 7. Change a requirement (the "how do you stop AI rewriting our suite?" answer)
Edit an acceptance criterion in `requirements/book-publishing-website.md`, then:
```bash
kane-cli maintain reconcile --from requirements/book-publishing-website.md \
  --source-id book-publishing-website --mode agent   # proposed changes HOLD as ADD / MODIFY / ARCHIVE rows
kane-cli maintain evolve <ref>                        # re-design affected use-case; untouched items preserved
```
Nothing commits without a verdict.

---

## Part C: Tailoring for a named prospect

1. Replace `requirements/book-publishing-website.md` with their PRD, epic, or acceptance notes (`REQ_GLOB` is `requirements/*.md`).
2. Change `APP_URL` in the workflow `env:` block to their environment, and delete the `Start the Fernwood Press platform` step from the `evidence` job. A hosted site needs no runner-side server.
3. Replace `test-data/publishing.json` and the variable table in `.testmuai/context.md`.
4. If their site has sign-in, add the account as repo secrets and provision it in `scripts/test_data.py` (mark the password `"secret": true`).
5. Reset the graph: delete `.context/` or use `kane-cli maintain reconcile --from <new.md> --source-id <id>`.
6. Set `coverage_threshold` to their real release gate, and re-check `--parallel` (serial here is only because of the shared seat pool).

---

## Pre-demo checklist
- [ ] Repo cloned/forked, all 4 secrets set
- [ ] kane-cli installed, logged in, `config set-url` done
- [ ] Local app starts and `/health` is green
- [ ] Workflow ran green at least once (caches warm)
- [ ] A finished `.evidence` pack downloaded locally as a fallback
- [ ] `kane-cli evidence serve` opens it
- [ ] Test Manager `publishing-demo` folder open in a tab
- [ ] A PR with a coverage comment ready to show
- [ ] Expect a "how do you stop AI rewriting tests?" question -> Step 7

## Gotchas
- Seats are a global pool that only resets when the app restarts. If submission tests fail with "fully booked", restart the app.
- Any test that submits a manuscript must withdraw it before ending, or later members lose capacity.
- Re-designing an already-designed use-case exits 2 ("already designed, use --force"); the pipeline treats this as fine.
- Partial-design gaps remain in the ribbon; fill locally with `kane-cli design tests` or run with `force_design`.
- Assurance commands (`context`, `design`, `cover`, `maintain`) are the web-UI surface. Rook is a different product and is not used here.
