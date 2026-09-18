# Fernwood Press — Release Requirements

**Product:** Fernwood Press, a self-publishing platform
**Environment under test:** http://127.0.0.1:5050 (the Flask app in `website/`, started by CI)
**Release:** R-2026.09
**Owner:** Author Platform

> This document is the single source of truth ingested by the assurance pipeline.
> Every requirement below must end up traceable to at least one designed test and one
> piece of execution evidence. Changing this file re-opens the graph.
>
> The platform has two halves. Authors **publish**: compare packages, submit a
> manuscript into one, claim a limited monthly onboarding seat, and track or withdraw
> the submission. Anyone **browses**: a showcase catalog of books already published
> through the platform. The catalog is a showcase, not a storefront — there is no
> price, no basket and no checkout anywhere in the published-books half.
>
> Every string quoted below was verified against the running app.

---

## REQ-01 — Site frame and navigation

Every page must carry the same frame so an author can move between the two halves
from anywhere.

Acceptance criteria:
- A promotional banner reads `1,200+ authors published · Free ISBN on every package`
  at the top of every page.
- The header carries the Fernwood Press logo linking to the home page, and three
  navigation links: `Publish Your Book` (to `/publish`), `Published Books`
  (to `/books`) and `Success Stories` (to `/success-stories`).
- The header carries a search box with the placeholder
  `Search titles, authors, or genres` and a `Search` button, on every page.
- The header carries a `My Submissions (N)` link, where N is the number of
  submissions currently held for this browser session.
- The footer links to `Contact & support`.

## REQ-02 — Home page

The home page must present both halves of the platform and the current catalog size.

Acceptance criteria:
- The page heading is `Publish your book with Fernwood Press`.
- A `Start Publishing` call to action leads to the publishing packages page.
- The page states the catalog size as `<count>+ books published through our platform`.
- A `Choose a publishing package` section shows all four packages, each with its
  name, tagline, price and a `View package` link.
- A `Recently published` section shows four book tiles, and each tile's title links
  to that book's detail page.
- `Compare all packages →` leads to `/publish`, and
  `Browse all published books →` leads to `/books`.

## REQ-03 — Publishing packages and monthly seats

Authors must be able to compare packages and see how much onboarding capacity is
left this month.

Acceptance criteria:
- `/publish` lists exactly four packages: Starter ($499, 45-day turnaround),
  Standard ($999, 30-day), Premium ($1999, 21-day) and Author's Choice ($3499, 14-day).
- Each package card lists that package's features.
- A package with seats left shows `<n> seats left this month`, and the count is
  singular (`1 seat left this month`) when exactly one remains.
- A package with seats left offers `Choose <package name>`; a package with none
  shows `Fully booked this month` and offers `View details` instead.
- Opening a package shows its code (`FP-PKG-01` … `FP-PKG-04`), tagline, price and
  `Turnaround: <n> business days`, plus its feature list.
- Requesting a package that does not exist returns a 404 rather than an error page.

## REQ-04 — Manuscript submission

An author must be able to submit a manuscript into a package, and must be told
clearly when the submission cannot be accepted.

Acceptance criteria:
- The package detail page offers a submission form with: book title, author name,
  email, a genre select defaulting to `Select a genre`, a manuscript status select
  defaulting to `Select manuscript status`, and an onboarding seat select.
- The manuscript status select offers exactly `New Manuscript` and `Revised Manuscript`.
- The seat select offers only seats that are still available this month.
- Submitting with any of book title, author name, email or genre missing is rejected
  with `Please fill in the book title, author name, email, and genre.` and no
  submission is created.
- Submitting without choosing a manuscript status is rejected with
  `Please select whether this is a new or revised manuscript.`
- Submitting with a seat that is already taken, or not offered, is rejected with
  `That seat is no longer available this month. Please choose another.`
- A valid submission returns to the package page and confirms with
  `Thanks, <author name> — "<book title>" has been submitted to the <package> package
  (<seat>). Reference: SUB-<n>. We'll be in touch within <n> business days.`
- After a valid submission the package's remaining seat count on `/publish` has
  dropped by one.
- When a package has no seats left, its detail page shows
  `This package is fully booked for the month. Please check back next month or choose
  another package.` and offers no submission form.

## REQ-05 — Tracking and withdrawing a submission

An author must be able to see what they have submitted and take it back.

Acceptance criteria:
- With nothing submitted, `/my-submissions` shows
  `You haven't submitted a manuscript yet.` and a link to browse packages.
- After submitting, `/my-submissions` lists the submission in a table with columns
  Reference, Book Title, Author, Package, Seat and Status.
- A new submission's status is `Under Review`.
- The header `My Submissions (N)` count matches the number of rows in the table.
- Each row offers a `Withdraw` control that removes that row from the table.
- Withdrawing returns the seat to the pool: the package's remaining seat count on
  `/publish` goes back up by one.

## REQ-06 — Published books catalog and genre browsing

Anyone must be able to browse the catalog of books published through the platform.

Acceptance criteria:
- `/books` states the catalog size as
  `<total> books published through Fernwood Press so far.`
- `/books` lists every genre with the number of titles in it, and each genre name
  links to that genre's listing page.
- A genre listing shows `<total> book(s) found`, counting **every** match in the
  genre — not the number currently displayed on the page.
- The listing offers a sort control with `Title (A-Z)` (the default) and
  `Rating (high to low)`; choosing rating reorders the tiles highest-rating first.
- The listing offers a `Show` control with 6, 12 and 20 per page; the default shows
  20, and choosing 6 renders exactly six tiles while the found count stays unchanged.
- The listing offers `Grid view` and `List view`, and both show the same books.
- Every tile shows a cover image, the title as a link, the author, `Rating: <n>`
  and the format.
- A genre that does not exist returns a 404 and shows `No books found in this genre.`

## REQ-07 — Book search

Anyone must be able to find a published book from the header search box.

Acceptance criteria:
- Searching sends the term to `/search` as a shareable URL carrying the term, and
  the results page is headed `Search results for "<term>"`.
- A term that matches a title returns that book — searching `The Iron Court`
  returns exactly one result, `The Iron Court` by `Branwen Oduya`.
- Matching is case-insensitive: a lower-case term returns the same results as the
  same term upper-cased.
- A term is matched against title, author **and** genre, so searching a genre name
  such as `Mystery` returns that genre's books.
- Each result tile shows the cover, the title as a link to the book, the author,
  `Rating: <n>` and the format.
- A term that matches nothing shows `No books match your search` rather than an
  empty page or an error.
- Submitting the search box with no term shows the same `No books match your search`
  message.

## REQ-08 — Book detail page

A book's page must carry enough bibliographic detail to be credible, and must route
the reader back into publishing.

Acceptance criteria:
- The page shows the title, `by <author>`, the genre, `Rating: <n>`, the format,
  a valid `ISBN: <isbn-13>`, `Published <Month YYYY>` and the blurb.
- The page shows a cover image for that book.
- The page states which package the book was published through, as
  `Published via our <package name> package.`, linking to that package.
- A `Publish your book like this one` call to action leads to `/publish`.
- Requesting a book that does not exist returns a 404.

## REQ-09 — Social proof and support

Acceptance criteria:
- `/success-stories` is headed `Author success stories` and shows six testimonials.
- Each testimonial shows the quote, the author's name, a link to that author's book
  on the platform, and the package they used.
- `/contact` is headed `Contact & support` and shows the support hours
  `Monday–Friday, 9:00am–5:00pm.` and the phone number `(555) 020-0200`.
- `/contact` tells the reader to quote their `SUB-` reference number and links to
  `/my-submissions`.

---

## Notes for test design

- **Seats are a shared, global monthly pool.** A seat claimed by any visitor is gone
  for every visitor until it is withdrawn; the pool only resets when the app
  restarts. Submissions themselves are per-browser-session.
  Starter has 6 seats, Standard 4, Premium 2 and Author's Choice exactly 1.
  Use **Starter** for ordinary submission tests so the pool is not exhausted.
- **Author's Choice is reserved as the fully-booked fixture and no test should
  submit into it.** On a bare app restart Author's Choice still shows its one
  seat as available — nothing makes it "fully booked" by itself. The CI
  environment (`scripts/serve_website.sh`) claims that one seat once, right
  after the app starts, via the site's own `/dev/seed` fixture route, so that
  for the rest of that run Author's Choice genuinely is fully booked and any
  test can rely on `/publish/authors-choice` showing the fully-booked state
  without a setup step of its own.
- A test that submits a manuscript into any **other** package should **withdraw
  it again** so the seat returns to the pool and later tests still have capacity.
- There is no sign-in anywhere on this platform. Identity is the browser session
  cookie, nothing more.
