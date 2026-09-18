---
assurance:
  id: t-28
  base: sha256:34302e5be94f456cec261d71ed2e2bea322732a8fcc1f590db749771c64cba00
---
# Missing published book detail request returns HTTP 404

> Prove that a missing published-book detail request returns a 404 rather than rendering a misleading detail page.

## Step 1 @verifies ac-137

Open {{home_page_url}} in the browser, then request {{nonexistent_book_detail_url}} in the same tab, then assert the main document response status is HTTP 404.
