---
assurance:
  id: t-2
  base: sha256:bcef68de64957de1c70628da81597ac89f3b8bf32f7673d7e6a3211bb5db54fa
---
# Missing genre page returns 404 with the no-books-found message

> Prove that a missing genre returns a 404 and the page shows `No books found in this genre.`

## Step 1

Open {{start_url}}/books in a fresh browser session.

## Step 2

On `/books`, store the destination URL of the first visible genre link as `known_genre_url`.

## Step 3 @verifies ac-12, ac-13, ac-1, ac-2, ac-3

Using `known_genre_url`, replace only its final path segment with `{{nonexistent_genre_slug}}`, open that derived URL directly, then assert the page response status is 404, the page shows `No books found in this genre.`, and no visible price amounts, basket controls, or checkout actions appear anywhere in the published-books area.
