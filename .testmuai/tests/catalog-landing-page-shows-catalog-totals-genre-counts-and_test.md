---
assurance:
  id: t-3
  base: sha256:609a6ea28ea411512e44fb03a1d14c69ef5dacd68d858cf15f94a7a684e10653
---
# Catalog landing page shows catalog totals, genre counts, and genre links

> Prove that `/books` states the total catalog size, lists every genre with its title count, and each genre name links to a genre listing page.

## Step 1

Open {{start_url}}/books in a fresh browser session.

## Step 2 @verifies ac-9, ac-1, ac-2, ac-3

On the `/books` page, inspect the published-books catalog summary, then assert there is visible text matching `<number> books published through Fernwood Press so far.` and no visible price amounts, basket controls, or checkout actions appear anywhere in the published-books area.

## Step 3 @verifies ac-10, ac-11

On the same `/books` page, inspect every visible genre entry in the genre list, then assert each displayed genre entry shows a title count and the genre name is rendered as a link with a non-empty destination different from the current `/books` URL.
