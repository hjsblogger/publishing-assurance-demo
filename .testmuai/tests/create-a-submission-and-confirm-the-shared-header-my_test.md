---
assurance:
  id: t-12
  base: sha256:71a7abcb29d3e43c64a05cd8186edc1b9dadedb2e2d147b10b61f217aab84692
---
# Create a submission and confirm the shared header My Submissions count matches the submissions table

> Prove that the shared header reflects the current browser session's submission total after a real submission is created.

## Step 1

Open {{home_page_url}} in the browser and use the shared header `Publish Your Book` link to reach the publishing packages page.

## Step 2 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65

On the `/publish` page, confirm the common site frame is present and open the `Starter` package detail page, then assert the top banner text `1,200+ authors published · Free ISBN on every package`, the header Fernwood Press logo, the `Publish Your Book`, `Published Books`, and `Success Stories` links, the search box placeholder `Search titles, authors, or genres`, the `Search` button, the `My Submissions (` link with a numeric count in parentheses, and the footer `Contact & support` link are all visible.

## Step 3

On the `Starter` package detail page, submit a manuscript using book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, any non-placeholder genre option, manuscript status `New Manuscript`, and any onboarding seat currently offered for Starter.

## Step 4 @verifies ac-56, ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-66

Open `My Submissions (N)` from the shared header, then assert the page shows a table with the columns Reference, Book Title, Author, Package, Seat and Status, the submitted row for {{publish_test_book_title}} is present in that table, the shared banner, header logo, three primary navigation links, search placeholder `Search titles, authors, or genres`, `Search` button, and footer `Contact & support` link are still visible, and the `My Submissions (N)` count equals the number of rows currently shown in the table.

## Step 5

In the `/my-submissions` table, withdraw the submission row for {{publish_test_book_title}} so the Starter seat returns to the pool for later tests.
