---
assurance:
  id: t-22
  base: sha256:fd0947e69a19b93762f43eb914fb86249dadbdc2b74ccab937befe26f1a39e08
---
# Show the fully booked message and no submission form on a package detail page with zero seats left

> Prove that a package with no seats left suppresses the submission form and shows the fully booked message on its detail page.

## Step 1 @verifies ac-111, ac-112

Open {{fully_booked_package_detail_url}}. On the package detail page for a package with no seats left, inspect the primary content area, then assert the page shows `This package is fully booked for the month. Please check back next month or choose another package.` and no submission form is present.
