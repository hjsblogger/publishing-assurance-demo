---
assurance:
  id: t-27
  base: sha256:62a12f8cd7d003c3dd3fac871d029f601abc099edb4e7990893ea010210d62ff
---
# Publish-your-book CTA on a published book detail page routes to the publishing packages page

> Prove that the book-detail-page conversion CTA routes the reader from a valid book page into the publishing packages page.

## Step 1

Open {{home_page_url}} in the browser and use the header search for `The Iron Court` to reach the detail page for `The Iron Court` by `Branwen Oduya`.

## Step 2 @verifies ac-127

On the `The Iron Court` detail page, activate the `Publish your book like this one` call to action, then assert the browser URL is `/publish`.
