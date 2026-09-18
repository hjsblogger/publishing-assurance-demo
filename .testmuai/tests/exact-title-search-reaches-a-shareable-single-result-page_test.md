---
assurance:
  id: t-17
  base: sha256:a553a6a36eac6aef3e57496262150433c077187857d4bb501ea0b4aeee14d564
---
# Exact title search reaches a shareable single-result page and stays stable across case variants

> Prove that a known title search from the header routes to a shareable `/search` page, shows the headed results page, returns the documented single result for `The Iron Court`, preserves that result across lower-case and upper-case variants of the same term, and renders the documented tile fields.

## Step 1

Open {{home_page_url}} in the browser and wait until the site header search box is available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-82, ac-83, ac-87, ac-88, ac-89, ac-90, ac-91

On {{home_page_url}}, use the site header search box to search for `The Iron Court`, then assert the URL contains `/search`, the URL carries `The Iron Court`, the page heading reads `Search results for "The Iron Court"`, exactly 1 result tile is shown, and that tile shows a cover image, the linked title `The Iron Court`, the author `Branwen Oduya`, visible text beginning `Rating: `, and a format.

## Step 3

From the search results page header, search for `the iron court` and store the visible result titles and authors as `lower_case_results`.

## Step 4 @verifies ac-84

From the search results page header, search for `THE IRON COURT`, then assert the visible result titles and authors equal `lower_case_results`.
