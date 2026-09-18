---
assurance:
  id: t-30
  base: sha256:6900ca57beee506dfabddbd3c0c3687bf187ef3b8542c2b6f3e1d7f9ae649e89
---
# Genre search returns visible results whose linked books all belong to that genre

> Prove that searching `Mystery` matches on genre and returns books that belong to the `Mystery` genre while still using the standard search results presentation.

## Step 1

Open {{home_page_url}} in the browser and reach the site's home page with the shared header search box available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-94

From the shared header search box, submit the term `Mystery` and wait for the search results page, then assert the URL contains `/search`, the URL still carries `Mystery`, the heading reads `Search results for "Mystery"`, and at least one search result tile is displayed.

## Step 3 @verifies ac-87, ac-88, ac-89, ac-90, ac-91

On the `Search results for "Mystery"` page, inspect each displayed result tile, then assert every tile shows a cover image, the title as a link to a book page, the author, a `Rating: <n>` value, and the format.

## Step 4 @verifies ac-86

From the `Search results for "Mystery"` page, open each displayed result through its title link and return to the results list after each inspection, then assert every linked book detail page shows the genre `Mystery`.
