---
assurance:
  id: t-2
  base: sha256:52e8fa4186a3e77cd6baa8e3dc51f8cb1e8e8afb53a52069e95a979a643e7396
---
# Missing genre page returns 404 with the no-books-found message

> Prove that a missing genre returns a 404 and the page shows `No books found in this genre.`

## Step 1

Open {{start_url}}/books in a fresh browser session.

## Step 2

On `/books`, store the destination URL of the first visible genre link as `known_genre_url`.

## Step 3 @verifies ac-12, ac-13, ac-1, ac-2, ac-3

Using `known_genre_url`, replace only its final path segment with `{{nonexistent_genre_slug}}`, open that derived URL directly, then assert the page response status is 404, the page shows `No books found in this genre.`, and no visible price amounts, basket controls, or checkout actions appear anywhere in the published-books area.
