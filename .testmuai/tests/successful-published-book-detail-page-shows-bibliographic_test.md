---
assurance:
  id: t-26
  base: sha256:e0630acde31dd697eea07f3a5251204ee3ac994b97f32002b1a3cf0e7a62c704
---
# Successful published book detail page shows bibliographic details, cover image, and a linked publishing package

> Prove that a valid published-book detail page renders the promised credibility details, cover image, published-via package statement, and package link on the successful detail-page outcome.

## Step 1

Open {{home_page_url}} in the browser and use the header search for `The Iron Court` to reach the detail page for `The Iron Court` by `Branwen Oduya`.

## Step 2 @verifies ac-125, ac-128, ac-129, ac-130, ac-131, ac-132, ac-133, ac-134, ac-135, ac-136

On the `The Iron Court` detail page, inspect the bibliographic content area and the cover area, then assert the page shows the title `The Iron Court`, the author `by Branwen Oduya`, a genre, `Rating: <n>`, a format, an `ISBN:` value formatted as a valid ISBN-13, `Published <Month YYYY>`, a blurb, a cover image, and the statement `Published via our <package name> package.` with the package name rendered as a link.

## Step 3 @verifies ac-126

From the `Published via our <package name> package.` statement on the same detail page, open the linked package name, then assert the destination page shows package detail content including its code, tagline, price, and `Turnaround: <n> business days`.
