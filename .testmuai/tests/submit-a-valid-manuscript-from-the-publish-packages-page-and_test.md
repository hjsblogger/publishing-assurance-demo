---
assurance:
  id: t-20
  base: sha256:a75315c9b9c0c198a8cd9aa597c188c65a4410359b36a481a194a9db9ec8d32b
---
# Submit a valid manuscript from the /publish packages page and confirm the submission details and seat decrement

> Prove that a complete valid submission succeeds, returns the authored confirmation details and reference, and reduces the package's shared remaining seat count by one.

## Step 1

Open {{publish_packages_url}}. On the website's /publish packages page, identify a package that shows at least one remaining seat, store its package name as `selected_package_name` and its remaining seat count as `baseline_seat_count`, then open that package's detail page.

## Step 2 @verifies ac-96, ac-97, ac-98, ac-99, ac-100, ac-101, ac-102

On the selected package detail page, inspect the submission form, then assert the page shows a book title input, an author name input, an email input, an onboarding seat select, the genre select default `Select a genre`, the manuscript status select default `Select manuscript status`, and manuscript status options exactly `New Manuscript` and `Revised Manuscript`.

## Step 3 @verifies ac-104, ac-105, ac-106, ac-107, ac-108, ac-109

On the same package detail page, choose any non-default genre, choose `New Manuscript`, store one currently offered onboarding seat as `selected_seat`, submit the form with book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, and email {{publish_test_author_email}}, then assert the confirmation includes {{publish_test_author_name}}, includes "{{publish_test_book_title}}", includes `selected_package_name package`, includes `(selected_seat)`, shows a reference matching `SUB-<n>`, and includes a turnaround window in business days.

## Step 4 @verifies ac-103

Return to {{publish_packages_url}}, locate the same `selected_package_name` package listing, then assert its remaining seat count is exactly one less than `baseline_seat_count`.
