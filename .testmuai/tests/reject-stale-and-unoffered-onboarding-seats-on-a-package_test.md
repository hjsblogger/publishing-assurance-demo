---
assurance:
  id: t-21
  base: sha256:1517b08b767437edf33c1adaeab3549349be2fe81427502fbb81a51ab89d5511
---
# Reject stale and unoffered onboarding seats on a package detail page

> Prove that a seat value that is no longer available or was never offered is rejected with the seat-unavailable message and no successful submission.

## Step 1

Open {{publish_packages_url}}. On the website's /publish packages page, identify a package that shows at least two remaining seats, store its package name as `selected_package_name`, and open that package's detail page.

## Step 2 @verifies ac-96, ac-97, ac-98, ac-99, ac-100, ac-101, ac-102

On the selected package detail page, inspect the submission form, then assert the page shows a book title input, an author name input, an email input, an onboarding seat select, the genre select default `Select a genre`, the manuscript status select default `Select manuscript status`, and manuscript status options exactly `New Manuscript` and `Revised Manuscript`.

## Step 3

On the same package detail page, store one currently offered onboarding seat as `stale_candidate_seat` and keep this tab open on the submission form.

## Step 4

In a second browser tab on the same site, open {{publish_packages_url}}, open the `selected_package_name` package detail page, and complete a valid submission with book title {{publish_test_book_title}} stale lock, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-default genre, manuscript status `New Manuscript`, and `stale_candidate_seat` so that the seat becomes unavailable.

## Step 5 @verifies ac-110

Back on the original loaded package detail page, submit the form with book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-default genre, manuscript status `Revised Manuscript`, and `stale_candidate_seat`, then assert the page shows `That seat is no longer available this month. Please choose another.`

## Step 6 @verifies ac-110

Without leaving the same package detail page, use browser DevTools to set the onboarding seat field to {{publish_unoffered_seat_value}} even though that value is not among the currently offered options, submit the otherwise valid form, then assert the page shows `That seat is no longer available this month. Please choose another.`
