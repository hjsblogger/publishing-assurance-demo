---
assurance:
  id: t-18
  base: sha256:d3d0bc92cabdd1cd23a5c22dcff44dfc54f2b6c20913612243ea8992251330fc
---
# Genre search returns visible results whose linked books all belong to that genre

> Prove that searching `Mystery` matches on genre and returns books that belong to the `Mystery` genre while still using the standard search results presentation.

## Step 1

Open {{home_page_url}} in the browser and wait until the site header search box is available.

## Step 2 @verifies ac-79, ac-80, ac-81, ac-94, ac-87, ac-88, ac-89, ac-90, ac-91

On {{home_page_url}}, use the site header search box to search for `Mystery`, then assert the URL contains `/search`, the URL carries `Mystery`, the page heading reads `Search results for "Mystery"`, at least one result tile is shown, and every visible result tile shows a cover image, a linked book title, an author, visible text beginning `Rating: `, and a format.

## Step 3 @verifies ac-86

From the `Mystery` search results page, open each displayed result's title link one at a time and return to the results after each check, then assert every opened book page shows the genre `Mystery`.
