---
assurance:
  id: t-6
  base: sha256:5e6d2334cadbce5a9eeb40eed2fcdd5d95107bfc59d15985cb984661fd8675c9
---
# Nonexistent publishing package request returns HTTP 404

> Prove an invalid package request returns a 404 response instead of a generic error page.

## Step 1 @verifies ac-37

From {{start_url}}/publish, inspect any `View package` link to determine the package-detail URL pattern, request the same pattern with the final package identifier replaced by {{nonexistent_package_slug}}, then assert the HTTP response status is 404.
