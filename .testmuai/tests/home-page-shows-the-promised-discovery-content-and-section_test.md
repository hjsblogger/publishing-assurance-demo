---
assurance:
  id: t-10
  base: sha256:65c96caf8fe18a0a3892f738ab5cc19ac06ca119357aa99d20b02bc0f791d3cd
---
# Home page shows the promised discovery content and section counts

> Prove that the home page presents the discovery content promised to a first-time visitor: the heading, the catalog-size statement, four package previews with their required metadata, and four recently published book tiles.

## Step 1

Open {{home_page_url}} in the browser and wait for the Fernwood Press home page to load.

## Step 2 @verifies ac-55, ac-54

In the home page hero area, inspect the main heading and catalog-size statement, then assert the heading reads `Publish your book with Fernwood Press` and the page shows text matching `<count>+ books published through our platform`.

## Step 3 @verifies ac-48

In the `Choose a publishing package` section, count the package previews, then assert exactly four package previews are shown.

## Step 4 @verifies ac-49, ac-50, ac-45, ac-51

In the same `Choose a publishing package` section, inspect every package preview, then assert each preview shows a visible package name, tagline, price, and `View package` link.

## Step 5 @verifies ac-52

In the `Recently published` section, count the displayed book tiles, then assert exactly four book tiles are shown.
