---
assurance:
  id: t-5
  base: sha256:1ade64d43789399a3b061bc8bb7b94788d18e1cd181e3d8ffd1bb43a0c873a6d
---
# Each publishing package detail page shows its published commercial details

> Prove every real package detail page exposes its package code, tagline, price, turnaround in business days, and feature list.

## Step 1

Open {{start_url}}/publish to begin the package-detail review.

## Step 2 @verifies ac-32, ac-33, ac-34, ac-35, ac-36

From {{start_url}}/publish, open the Starter package detail page, then assert it shows code `FP-PKG-01`, a tagline, price `$499`, `Turnaround: 45 business days`, and a feature list.

## Step 3 @verifies ac-32, ac-33, ac-34, ac-35, ac-36

Return to {{start_url}}/publish, open the Standard package detail page, then assert it shows code `FP-PKG-02`, a tagline, price `$999`, `Turnaround: 30 business days`, and a feature list.

## Step 4 @verifies ac-32, ac-33, ac-34, ac-35, ac-36

Return to {{start_url}}/publish, open the Premium package detail page, then assert it shows code `FP-PKG-03`, a tagline, price `$1999`, `Turnaround: 21 business days`, and a feature list.

## Step 5 @verifies ac-32, ac-33, ac-34, ac-35, ac-36

Return to {{start_url}}/publish, open the Author's Choice package detail page, then assert it shows code `FP-PKG-04`, a tagline, price `$3499`, `Turnaround: 14 business days`, and a feature list.
