---
assurance:
  id: t-31
  base: sha256:f0e802a5b854128111d6e8266d14027b618152e205d56c490fea27ffbb7ecfee
---
# Exact title search reaches a shareable single-result page and stays stable across case variants

> Prove that a known title search from the header routes to a shareable `/search` page, shows the headed results page, returns the documented single result for `The Iron Court`, preserves that result across lower-case and upper-case variants of the same term, and renders the documented tile fields.

## Step 1

Open {{home_page_url}} in the browser and reach the site's home page with the shared header search box available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-82, ac-83

From the shared header search box, submit `The Iron Court` and wait for the results page, then assert the URL contains `/search`, the URL still carries `The Iron Court`, the heading reads `Search results for "The Iron Court"`, exactly one result tile is displayed, and `The Iron Court` by `Branwen Oduya` is present.

## Step 3 @verifies ac-87, ac-88, ac-89, ac-90, ac-91

On the `Search results for "The Iron Court"` page, inspect the displayed result tile, then assert it shows a cover image, the title as a link to a book page, the author, a `Rating: <n>` value, and the format.

## Step 4

From the shared header search box on the results page, submit `the iron court` and store the displayed result titles and authors as lower_case_results.

## Step 5 @verifies ac-84

From the shared header search box, submit `THE IRON COURT` and compare the displayed result titles and authors to lower_case_results, then assert the upper-case search returns the same results as the lower-case search.
