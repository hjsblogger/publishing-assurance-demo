---
assurance:
  id: t-29
  base: sha256:b76163f8d383f8542cfc40a38259cd8785c625fa76d363aad8c065545c554332
---
# Recently published title link opens the matching book detail page

> Prove that a visitor can use a title link in the `Recently published` section to open the detail page for that same displayed book.

## Step 1

Open {{home_page_url}} in the browser and wait until the Fernwood Press home page is visible with the `Recently published` section in view.

## Step 2 @verifies ac-53

In the `Recently published` section, store the visible title text from one book tile as `selected_recent_book_title` and open that tile's title link, then assert the destination page shows `selected_recent_book_title` as the book title.
