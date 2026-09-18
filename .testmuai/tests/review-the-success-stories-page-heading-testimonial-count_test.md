---
assurance:
  id: t-16
  base: sha256:b9fe27d35c7cbfa235e62fc0828872af67f2909849a1457987d5c62744bf92ef
---
# Review the success stories page heading, testimonial count, and testimonial fields

> Prove the success stories page presents the promised heading, exactly six testimonials, and the required content on every testimonial card.

## Step 1

Open {{home_page_url}} in the browser and use the shared header's Success Stories navigation to reach the `/success-stories` page.

## Step 2 @verifies ac-72

On the `/success-stories` page, review the visible page heading and then assert the heading equals `Author success stories`.

## Step 3 @verifies ac-73, ac-74, ac-75, ac-76, ac-77

On the `/success-stories` page, review all displayed testimonial cards and then assert exactly 6 testimonials are shown and each testimonial shows a quote, an author's name, a link to that author's book on the platform, and the package they used.
