---
assurance:
  id: t-1
  base: sha256:38eda0cdb065e78a624d89fcb2da074c3ccf3107d03652ca01f268cd8355aeb0
---
# Genre listing shows default controls and complete book-tile metadata

> Prove that an existing genre listing shows `<total> book(s) found` for all genre matches, defaults to `Title (A-Z)`, and each displayed tile shows a cover image, linked title, author, `Rating: <n>`, and format.

## Step 1

Open {{start_url}}/books in a fresh browser session.

## Step 2 @verifies ac-14, ac-15, ac-16, ac-17, ac-18, ac-19, ac-20

On `/books`, open the first visible genre link to reach a valid genre listing page, then assert the listing shows visible text matching `<number> book(s) found`, the selected sort option is `Title (A-Z)`, the sort control also offers `Rating (high to low)`, the selected `Show` value is 20, the `Show` control offers exactly 6, 12, and 20, and visible `Grid view` and `List view` controls are present.

## Step 3 @verifies ac-1, ac-2, ac-3, ac-4, ac-5, ac-6, ac-7, ac-8

On the same genre listing page, inspect every displayed book tile and the surrounding published-books surface, then assert each visible tile shows a cover image, the title as a link, author text, rating text beginning with `Rating: `, and format text, and that no visible price amounts, basket controls, or checkout actions appear anywhere on the page.
