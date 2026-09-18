---
assurance:
  id: t-7
  base: sha256:e69ffff99d0bfe2852254e9e2a29043fbfab1fa1f01902ab6c3168c2e5ed60d4
---
# Follow the contact-page submissions link to the submissions area

> Prove the contact page tells the reader to quote a SUB- reference number and routes them to `/my-submissions` for submission help.

## Step 1

Open {{contact_page_url}} in a browser as the Fernwood Press contact page.

## Step 2 @verifies ac-41, ac-42

On the contact page, review the submission-help copy near the support details, then assert the page tells the reader to quote their `SUB-` reference number and shows a link to `/my-submissions`.

## Step 3 @verifies ac-43

From the same contact page, use the `/my-submissions` link and wait for the destination page to load, then assert the browser URL contains `/my-submissions`.
