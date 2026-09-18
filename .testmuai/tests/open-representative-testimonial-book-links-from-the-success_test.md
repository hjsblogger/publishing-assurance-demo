---
assurance:
  id: t-15
  base: sha256:60540b33030d50440dedea34a4a43cefbeef52c3102d5c54147f7823e7e30fa9
---
# Open representative testimonial book links from the success stories page

> Prove the success stories page exposes working testimonial book links that lead from the social-proof page into showcased book detail pages on the platform.

## Step 1

Open {{home_page_url}} in the browser and use the shared header's Success Stories navigation to reach the `/success-stories` page.

## Step 2

On the `/success-stories` page, review the first testimonial, store its author name as first_testimonial_author, open that testimonial's book link, and then assert the testimonial displayed an author name, exposed a link to a book on the platform, the destination URL contains `/books/`, and the opened book page shows `by ` followed by first_testimonial_author.

## Step 3 @verifies ac-78, ac-75, ac-76

Return to the `/success-stories` page, review the third testimonial as the middle representative, store its author name as middle_testimonial_author, open that testimonial's book link, and then assert the testimonial displayed an author name, exposed a link to a book on the platform, the destination URL contains `/books/`, and the opened book page shows `by ` followed by middle_testimonial_author.

## Step 4 @verifies ac-78, ac-75, ac-76

Return to the `/success-stories` page, review the sixth testimonial as the last representative, store its author name as last_testimonial_author, open that testimonial's book link, and then assert the testimonial displayed an author name, exposed a link to a book on the platform, the destination URL contains `/books/`, and the opened book page shows `by ` followed by last_testimonial_author.
