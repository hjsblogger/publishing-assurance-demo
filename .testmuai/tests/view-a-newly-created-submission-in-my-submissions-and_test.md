---
assurance:
  id: t-25
  base: sha256:743789c67f5ed153dee02afc4f69d1652a357df9a8ab9e63f09ba9bcb020397f
---
# View a newly created submission in My Submissions and confirm its details, status, count, and withdraw control

> Prove that after a successful submission, `/my-submissions` shows the submission in the current browser session with the required table columns, `Under Review` status, matching header count, and per-row `Withdraw` control.

## Step 1

Open {{publish_packages_url}}. On the Fernwood Press `/publish` packages page, open the `Starter` package detail page from a package listing that is available for submission.

## Step 2

On the `Starter` package detail page, submit a manuscript using book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-placeholder genre option, manuscript status `New Manuscript`, and any currently offered Starter seat; on the confirmation view, store the shown `SUB-` reference as `submitted_reference` and the confirmed seat label as `chosen_seat`.

## Step 3 @verifies ac-115, ac-117, ac-118, ac-119, ac-124

Open `My Submissions (N)` from the shared header, then assert `/my-submissions` shows a table with the columns Reference, Book Title, Author, Package, Seat and Status, shows a row for `submitted_reference` whose Book Title is {{publish_test_book_title}}, Author is {{publish_test_author_name}}, Package is `Starter`, Seat matches `chosen_seat`, Status is `Under Review`, shows a `Withdraw` control on that row, and shows a `My Submissions (N)` count equal to the number of submission rows shown in the `/my-submissions` table.

## Step 4

On `/my-submissions`, withdraw the row for `submitted_reference` so the Starter seat returns to the pool for later runs.
