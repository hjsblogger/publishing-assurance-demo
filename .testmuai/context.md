# Test data for the Fernwood Press platform

Some designed steps describe their data in words instead of naming a variable. When a
step asks for one of these, use the variable given here. Never invent a book, an
author or a seat.

| When a step says… | Use |
|---|---|
| a book to search for, or a known / existing book | `{{known_book_title}}` by `{{known_book_author}}` — genre `{{known_book_genre}}`, `Rating: {{known_book_rating}}`, format `{{known_book_format}}`, published via the `{{known_book_package}}` package |
| the same term in a different case | `{{lowercase_search_term}}` |
| a genre name typed into the search box | `{{genre_search_term}}` |
| a search term that matches nothing | `{{no_match_term}}` |
| a genre to browse | `{{browse_genre}}` — it holds `{{genre_title_count}}` titles |
| a second, different genre | `{{second_genre}}` |
| a smaller page size | `{{small_page_size}}` |
| a genre that does not exist | `{{unknown_genre}}` |
| a book / package that does not exist | `{{unknown_book_id}}` / `{{unknown_package_id}}` |
| a package to submit a manuscript into | `{{submission_package}}` (id `{{submission_package_id}}`, `{{submission_package_price}}`, `{{submission_package_turnaround}}`-day turnaround) |
| a package with only one seat, or the fully-booked fixture | `{{single_seat_package}}` (id `{{single_seat_package_id}}`) |
| valid manuscript details | book title `{{manuscript_title}}`, author name `{{author_name}}`, email `{{author_email}}`, genre `{{manuscript_genre}}`, manuscript status `{{manuscript_status}}`, seat `{{onboarding_seat}}` |
| a revised manuscript | the same details, but manuscript status `{{revised_manuscript_status}}` |
| a seat that is not available | `{{unavailable_seat}}` |

## Rules that keep the suite re-runnable

- **Seats are a global monthly pool, not per-visitor.** Claiming one removes it for
  everyone until it is withdrawn, and the pool only resets when the app restarts.
- **A test that submits a manuscript must withdraw it again** before it ends, so the
  seat returns to the pool and later members still have capacity. Withdrawing is the
  `Withdraw` button on the `My Submissions` page.
- Use `{{submission_package}}` (6 seats) for ordinary submission tests. Only the
  fully-booked scenario should touch `{{single_seat_package}}`, which has exactly one.
- There is **no sign-in** on this platform. Never look for a login form, an account
  menu or a password field — identity is only the browser session cookie.
- The catalog is a **showcase**: there is no price, no basket and no checkout on any
  book page. Never look for an "Add to cart" control.
