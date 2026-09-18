---
assurance:
  id: t-13
  base: sha256:200d7e21de0cdf29f46b8075613f7d30ec4016b7a19691b8cc1d7df1dc15712f
---
# Traverse the shared header navigation between home, publishing, books, and success stories

> Prove that the logo and the three primary navigation links let a visitor move between the site's major sections while the shared frame remains present on each reached page.

## Step 1

Open {{home_page_url}} in the browser.

## Step 2 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-67

From the home page header, select `Publish Your Book`, then assert the `/publish` page shows exactly four package cards and the common frame still shows the banner text `1,200+ authors published · Free ISBN on every package`, the Fernwood Press logo, the `Publish Your Book`, `Published Books`, and `Success Stories` links, the search box placeholder `Search titles, authors, or genres`, the `Search` button, the `My Submissions (` link with a numeric count in parentheses, and the footer `Contact & support` link.

## Step 3 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-68

From the `/publish` header, select `Published Books`, then assert the catalog page shows a summary ending `books published through Fernwood Press so far.` and the same banner, logo, three primary navigation links, search placeholder `Search titles, authors, or genres`, `Search` button, `My Submissions (` link with a numeric count in parentheses, and footer `Contact & support` link remain visible.

## Step 4 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-69

From the `/books` header, select `Success Stories`, then assert the page heading `Author success stories` is visible and the same banner, logo, the `Publish Your Book` and `Published Books` links, the search placeholder `Search titles, authors, or genres`, the `Search` button, the `My Submissions (` link with a numeric count in parentheses, and the footer `Contact & support` link remain visible.

## Step 5 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-70

From the `/success-stories` header, select the Fernwood Press logo, then assert the home page heading `Publish your book with Fernwood Press` is visible and the same three primary navigation links, search placeholder `Search titles, authors, or genres`, `Search` button, `My Submissions (` link with a numeric count in parentheses, the promotional banner, and the footer `Contact & support` link remain visible.
