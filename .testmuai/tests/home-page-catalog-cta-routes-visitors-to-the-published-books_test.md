---
assurance:
  id: t-11
  base: sha256:e297ef4c5f14934d6da80cb4094a12613c179db6d3d8e7f1a9950da8ad2b5029
---
# Home page catalog CTA routes visitors to the published books catalog

> Prove that the home-page CTA for browsing all published books takes the visitor to `/books`.

## Step 1

Open {{home_page_url}} in the browser and wait for the Fernwood Press home page to load.

## Step 2 @verifies ac-47

On the Fernwood Press home page, activate `Browse all published books →`, then assert the browser URL path equals `/books`.
