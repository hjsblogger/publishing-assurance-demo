---
assurance:
  id: t-33
  base: sha256:b0fdda251310a332ffa9299368312fbcfd2c07555bd3804cbd67faa48c700109
---
# Reject a Starter package submission when a once-offered seat becomes stale or a forged seat is not offered

> Prove that a seat value that is no longer available or was never offered is rejected with the seat-unavailable message and no successful submission.

## Step 1

On the Fernwood Press publishing packages page at http://127.0.0.1:5050/publish, open the Starter package detail page in one browser tab, choose one currently offered onboarding seat, store its label as stale_seat_candidate, and keep that tab open on the submission form.

## Step 2

In a second browser tab, open the Starter package detail page again and submit a valid manuscript using {{publish_test_book_title}}, {{publish_test_author_name}}, {{publish_test_author_email}}, the first non-default genre option, manuscript status `New Manuscript`, and stale_seat_candidate, then store the returned submission reference as claimed_ref.

## Step 3 @verifies ac-110

Return to the first tab and submit the still-open Starter form with {{publish_test_book_title}}, {{publish_test_author_name}}, {{publish_test_author_email}}, the first non-default genre option, manuscript status `New Manuscript`, and stale_seat_candidate, then assert the page shows `That seat is no longer available this month. Please choose another.`

## Step 4 @verifies ac-110

On the same Starter package detail page, use the browser to change the onboarding seat field value to {{publish_unoffered_seat_value}} even though that value is not one of the offered options, submit the same valid manuscript details again, then assert the page shows `That seat is no longer available this month. Please choose another.`

## Step 5

On http://127.0.0.1:5050/my-submissions, withdraw the submission with reference claimed_ref so the claimed Starter seat returns to the pool for later tests.
