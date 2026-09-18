---
assurance:
  id: t-6
  base: sha256:4a14d4aa67f3399d457a55b8b281e244de6ae791cc5044a8974320b3a49b449c
---
# Nonexistent publishing package request returns HTTP 404

> Prove an invalid package request returns a 404 response instead of a generic error page.

## Step 1 @verifies ac-37

From {{start_url}}/publish, inspect any `View package` link to determine the package-detail URL pattern, request the same pattern with the final package identifier replaced by {{nonexistent_package_slug}}, then assert the HTTP response status is 404.
