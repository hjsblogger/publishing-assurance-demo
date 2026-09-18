---
assurance:
  id: t-35
  base: sha256:d7e7133aac2bf53670270ffb76cc9c833a829aab11990bd9e0ce2ae7560bb90a
---
# Show the fully booked message and no submission form on the Author's Choice package detail page

> Prove that a package with no seats left suppresses the submission form and shows the fully booked message on its detail page.

## Step 1 @verifies ac-111, ac-112

On the Fernwood Press Author's Choice package detail page at http://127.0.0.1:5050/publish/authors-choice, view the fully booked package state and assert the page shows `This package is fully booked for the month. Please check back next month or choose another package.` and no submission form is present.
