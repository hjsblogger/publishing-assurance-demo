---
assurance:
  id: t-32
  base: sha256:451fd4b8fce72228d537aaed46cd714332b0f75d05b0e09e4e50af1d09507a4c
---
# Unmatched and blank searches both show the explicit no-results message

> Prove that both an unmatched search term and a blank submission resolve to the same explicit `No books match your search` message instead of an empty or broken results page.

## Step 1

Open {{home_page_url}} in the browser and reach the site's home page with the shared header search box available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-92

From the shared header search box, submit {{no_match_search_term}} and wait for the results page, then assert the URL contains `/search`, the URL still carries {{no_match_search_term}}, the heading reads `Search results for "{{no_match_search_term}}"`, and the page shows `No books match your search`.

## Step 3 @verifies ac-93

From the shared header search box on the no-results page, submit the search box with no term, then assert the page shows `No books match your search`.
