---
assurance:
  id: t-19
  base: sha256:60d404fdef75dd0719b0ce103d67d485d0b43f3226c784723911ae0a6989dfbf
---
# Unmatched and blank searches both show the explicit no-results message

> Prove that both an unmatched search term and a blank submission resolve to the same explicit `No books match your search` message instead of an empty or broken results page.

## Step 1

Open {{home_page_url}} in the browser and wait until the site header search box is available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-92

On {{home_page_url}}, use the site header search box to search for `{{no_match_search_term}}`, then assert the URL contains `/search`, the URL carries `{{no_match_search_term}}`, the page heading reads `Search results for "{{no_match_search_term}}"`, and the page shows `No books match your search`.

## Step 3 @verifies ac-93

From the search results page header, clear the search box and submit it with no term, then assert the page shows `No books match your search`.
