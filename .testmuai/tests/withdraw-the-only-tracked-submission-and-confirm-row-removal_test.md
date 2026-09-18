---
assurance:
  id: t-23
  base: sha256:8447281352a3ebed1efade4fa28e0fac830093298b0fb44c0a822948e9d3490f
---
# Withdraw the only tracked submission and confirm row removal, empty state, and seat restoration

> Prove that withdrawing the current session's only tracked submission removes it from `/my-submissions`, returns one seat to the package's shared monthly pool, and leaves the session with no tracked submissions.

## Step 1

Open {{publish_packages_url}}. On the Fernwood Press `/publish` packages page, open the `Starter` package detail page from a package listing that is available for submission.

## Step 2

On the `Starter` package detail page, submit a manuscript using book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-placeholder genre option, manuscript status `New Manuscript`, and any currently offered Starter seat; on the confirmation view, store the shown `SUB-` reference as `submitted_reference` and the confirmed seat label as `chosen_seat`.

## Step 3 @verifies ac-115, ac-117, ac-118, ac-119

Open `My Submissions (N)` from the shared header, then assert `/my-submissions` shows a table with the columns Reference, Book Title, Author, Package, Seat and Status, shows the row for `submitted_reference` with status `Under Review`, shows a `Withdraw` control on that row, and shows a `My Submissions (N)` count equal to the number of submission rows shown in the `/my-submissions` table.

## Step 4

Return to {{publish_packages_url}}, locate the `Starter` package listing, store its current remaining seat count as `pre_withdraw_seat_count`, then reopen `/my-submissions` from the shared header.

## Step 5 @verifies ac-116, ac-120, ac-121, ac-122

On `/my-submissions`, withdraw the row for `submitted_reference`, then assert that row is no longer shown, the header reads `My Submissions (0)`, the page shows `You haven't submitted a manuscript yet.`, and a link to browse packages is shown.

## Step 6 @verifies ac-113

Return to {{publish_packages_url}}, locate the `Starter` package listing again, then assert its remaining seat count is exactly one more than `pre_withdraw_seat_count`.
