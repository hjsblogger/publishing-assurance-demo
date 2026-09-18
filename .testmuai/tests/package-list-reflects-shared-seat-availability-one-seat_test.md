---
assurance:
  id: t-4
  base: sha256:9ca9268f5cd36019d736c5254e8a0d496b4bf76dc843f322af784c6a09152051
---
# Package list reflects shared seat availability, one-seat wording, and fully booked actions

> Prove the package comparison page shows the fixed package set, package-card features, seat-capacity messaging, and the correct action for packages with plural remaining seats, exactly one remaining seat, and no seats left.

## Step 1

Open {{start_url}}/publish in browser session A and keep the page available for the shared-seat check.

## Step 2 @verifies ac-21, ac-22, ac-25, ac-27, ac-28, ac-29, ac-30, ac-31

Open {{start_url}}/publish in a second isolated browser session B, review the package cards, then assert there are exactly four cards for Starter, Standard, Premium, and Author's Choice; each card shows its specified price and turnaround and a feature list; every package card that currently has seats remaining shows a seats-left message and `Choose <package name>`; and the Author's Choice card shows `Fully booked this month` with `View details` and no `Choose Author's Choice`.

## Step 3

In browser session A, from {{start_url}}/publish open the Premium package detail page and submit one valid manuscript with book title {{publish_test_book_title}}, author name {{publish_test_author_name}}, email {{publish_test_author_email}}, genre Mystery, manuscript status New Manuscript, and any available Premium onboarding seat.

## Step 4 @verifies ac-23, ac-26

Back in browser session B on {{start_url}}/publish, refresh the package list after the Premium submission from session A, then assert the Premium card now shows `1 seat left this month`, proving the claimed seat changed the shared monthly pool seen by another visitor.

## Step 5

In browser session A, open {{start_url}}/my-submissions and withdraw the Premium submission created in this test so the seat returns to the pool for later runs.
