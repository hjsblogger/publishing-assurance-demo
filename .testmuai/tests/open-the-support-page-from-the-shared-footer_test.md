---
assurance:
  id: t-14
  base: sha256:1cdc9f1e94af96cba182092df5a5440bea87cf99aaa18eb2c16b8f8ac2125a24
---
# Open the support page from the shared footer

> Prove that the common footer keeps support reachable from another site section through the `Contact & support` link.

## Step 1

Open {{home_page_url}} in the browser.

## Step 2 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65

From the home page header, select `Published Books`, then assert the common site frame shows the banner text `1,200+ authors published · Free ISBN on every package`, the Fernwood Press logo, the `Publish Your Book`, `Published Books`, and `Success Stories` links, the search box placeholder `Search titles, authors, or genres`, the `Search` button, the `My Submissions (` link with a numeric count in parentheses, and the footer `Contact & support` link.

## Step 3 @verifies ac-57, ac-58, ac-59, ac-60, ac-61, ac-62, ac-63, ac-64, ac-65, ac-71

From the footer on `/books`, select `Contact & support`, then assert the page heading `Contact & support` is visible and the same banner, logo, three primary navigation links, search placeholder `Search titles, authors, or genres`, `Search` button, and `My Submissions (` link with a numeric count in parentheses remain visible.
