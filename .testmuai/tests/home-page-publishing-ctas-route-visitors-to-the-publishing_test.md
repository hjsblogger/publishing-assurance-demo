---
assurance:
  id: t-9
  base: sha256:4592bcfcef583f55e680083d0b550b62cada2ed3470c06e44fef07b4e55d7233
---
# Home page publishing CTAs route visitors to the publishing packages page

> Prove that each home-page publishing call to action that promises the publishing packages page takes the visitor to `/publish`.

## Step 1

Open {{home_page_url}} in the browser and wait for the Fernwood Press home page to load.

## Step 2 @verifies ac-44

On the Fernwood Press home page hero area, activate the `Start Publishing` call to action, then assert the browser URL path equals `/publish`.

## Step 3

Open {{home_page_url}} in the browser again and wait for the Fernwood Press home page to load.

## Step 4 @verifies ac-46

On the Fernwood Press home page, activate `Compare all packages →`, then assert the browser URL path equals `/publish`.
