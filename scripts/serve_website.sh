#!/usr/bin/env bash
#
# Start the Fernwood Press sample app and block until it actually serves traffic.
#
# The retail demo pointed at a hosted storefront; this demo's app under test lives in
# the repo, so CI has to bring it up itself. kane-cli drives a browser **on the
# runner**, so 127.0.0.1 is reachable from the test — no tunnel is needed.
#
# Writes the pid to .website.pid so a later step can stop it.
#
set -euo pipefail

PORT="${PORT:-5050}"
HOST="${HOST:-127.0.0.1}"
LOG="${WEBSITE_LOG:-website.log}"
PIDFILE="${WEBSITE_PIDFILE:-.website.pid}"
TIMEOUT="${WEBSITE_TIMEOUT:-60}"

cd "$(dirname "$0")/.."

python3 -m pip install --quiet --disable-pip-version-check -r website/requirements.txt

PORT="$PORT" nohup python3 website/server.py > "$LOG" 2>&1 &
echo $! > "$PIDFILE"
echo "Started website (pid $(cat "$PIDFILE")) on ${HOST}:${PORT}, logging to ${LOG}"

# Poll /health rather than sleeping: a fixed sleep is either wasted time or a flake.
for _ in $(seq "$TIMEOUT"); do
  if curl -fsS "http://${HOST}:${PORT}/health" > /dev/null 2>&1; then
    echo "Website is healthy: $(curl -fsS "http://${HOST}:${PORT}/health")"
    # Prove the catalog actually rendered — a 200 on /health only says Flask is up.
    TOTAL=$(curl -fsS "http://${HOST}:${PORT}/books" \
            | grep -oE '[0-9]+ books published' | head -1 || true)
    echo "Catalog: ${TOTAL:-unknown}"

    # Fixture: Author's Choice has exactly one onboarding seat and no designed
    # test ever submits into it, so this run permanently claims that seat via the
    # site's own /dev/seed fixture route — establishing the "fully booked" state
    # the suite needs (package-list and show-the-fully-booked-message tests) for
    # the lifetime of this app process. Seats are a global pool (see
    # requirements/book-publishing-website.md), so this is visible to every
    # session, not just the one that made the request.
    curl -fsS "http://${HOST}:${PORT}/dev/seed?submit=authors-choice:Seat%201:New%20Manuscript:CI%20Fixture%20Manuscript:CI%20Fixture:ci-fixture@example.com:Fiction" \
      > /dev/null
    echo "Fixture: claimed Author's Choice's only onboarding seat (fully-booked fixture for this run)."
    exit 0
  fi
  sleep 1
done

echo "::error title=Website did not start::No healthy response from http://${HOST}:${PORT}/health within ${TIMEOUT}s."
echo "--- ${LOG} ---"
cat "$LOG" || true
exit 1
