---
assurance:
  id: t-24
  base: sha256:3001bd84b068ac405892cfe16ff0c77fe44ba7ced12913a7c90461a36434495e
---
# Create a submission in one browser session and confirm another browser session cannot see it

> Prove that submission tracking is isolated to the browser session that created the submission, so a different browser session does not display that submission on `/my-submissions`.

## Step 1

Open {{publish_packages_url}} in browser session A. On the Fernwood Press `/publish` packages page, open the `Starter` package detail page from a package listing that is available for submission.

## Step 2

In browser session A on the `Starter` package detail page, submit a manuscript using book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-placeholder genre option, manuscript status `New Manuscript`, and any currently offered Starter seat; on the confirmation view, store the shown `SUB-` reference as `session_a_submission_ref`.

## Step 3 @verifies ac-114, ac-120, ac-121, ac-123

Open a separate isolated browser session B at {{publish_packages_url}} and use the shared header `My Submissions (N)` link to reach `/my-submissions`, then assert the page shows `You haven't submitted a manuscript yet.`, shows a link to browse packages, and does not show `session_a_submission_ref`.

## Step 4

Return to browser session A, open `/my-submissions` from the shared header, and withdraw the row for `session_a_submission_ref` so the Starter seat returns to the pool for later runs.
