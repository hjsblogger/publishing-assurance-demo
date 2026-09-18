---
assurance:
  id: t-34
  base: sha256:cb997ae233a900487b5dd32c3a69bdfdb87088f9038eab53619a39cad53107a9
---
# Submit a valid manuscript to the Starter package and confirm the package-page confirmation and seat decrement

> Prove that a complete valid submission succeeds, returns the authored confirmation details and reference, and reduces the package's shared remaining seat count by one.

## Step 1

On the Fernwood Press publishing packages page at http://127.0.0.1:5050/publish, store the Starter package card's displayed remaining seat count as baseline_remaining_seats, then open the Starter package detail page.

## Step 2 @verifies ac-96, ac-97, ac-98, ac-99, ac-100, ac-101, ac-102

On the Starter package detail page, inspect the submission form, store one offered onboarding seat label as selected_seat, and assert the form shows a book title input, an author name input, an email input, a genre select defaulted to `Select a genre`, a manuscript status select defaulted to `Select manuscript status`, exactly the manuscript-status options `New Manuscript` and `Revised Manuscript`, and an onboarding seat select.

## Step 3 @verifies ac-104, ac-105, ac-106, ac-107, ac-108, ac-109

On the same Starter package detail page, submit the manuscript using {{publish_test_book_title}}, {{publish_test_author_name}}, {{publish_test_author_email}}, the first non-default genre option, manuscript status `New Manuscript`, and selected_seat, store the returned submission reference as created_ref, then assert the returned package page confirms {{publish_test_author_name}}, "{{publish_test_book_title}}", `Starter package`, selected_seat, a reference matching `SUB-<n>`, and a turnaround window in business days.

## Step 4 @verifies ac-103

Return to the Fernwood Press publishing packages page at http://127.0.0.1:5050/publish and assert the Starter package card's displayed remaining seat count is exactly one less than baseline_remaining_seats.

## Step 5

On http://127.0.0.1:5050/my-submissions, withdraw the submission with reference created_ref so the claimed Starter seat returns to the pool for later tests.
