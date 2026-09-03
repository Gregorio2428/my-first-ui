# Study with Campus — Stationery Shop Browser

Half of the e-commerce project brief: **Design Theming + Home screen + routing
to an (intentionally empty) Product Detail screen.**

The catalog is modeled on the real **"studywithcampus"** Shopee shop — an
official Kokuyo Campus reseller — using the actual product names, prices
(in ₱), ratings, and sold counts visible on their listings. Product
photography is swapped for neutral placeholder images rather than the
seller's own photos.

## Run it

```bash
flutter pub get
flutter run
```

## Structure

```
lib/
  main.dart                       # Wires ThemeController + ThemeData + go_router
  theme/
    app_colors.dart                # Named palette (light + dark), no other file hardcodes a Color
    app_theme.dart                  # The single ThemeData.light()/dark(), fonts, ThemeExtensions
    theme_controller.dart          # StatefulWidget holding ThemeMode; InheritedWidget scope
  models/
    product.dart                    # Immutable Product model (price, discount, rating, sold count)
  data/
    product_repository.dart        # Catalog of 15 real Campus/Kokuyo listings
  router/
    app_router.dart                 # go_router route table (Navigation 2.0)
  screens/
    home_screen.dart                # AppBar + responsive GridView.builder
    product_detail_screen.dart      # Placeholder destination (next half of the project)
  widgets/
    product_card.dart               # Stateless — a card's content never changes post-build
    theme_toggle_button.dart        # The one bit of interactive chrome in the AppBar
```

## How this maps to the brief

- **Single ThemeData at the MaterialApp level.** `AppTheme.light()` /
  `AppTheme.dark()` are the only two places colors and text styles are
  defined. Widgets never hardcode a `Color(...)` — they read
  `Theme.of(context)` or the small `context.mutedText` / `context.tagAccent`
  / `context.discountColor` helpers, which pull from `ThemeExtension`s on
  the current theme. The palette leans on Campus's own cobalt blue (seen
  on the real packaging) paired with a warm mustard, rather than a
  generic e-commerce look.
- **Light/dark toggle, accessible from Home, changes the app immediately.**
  `ThemeController` is a `StatefulWidget` wrapping the whole app; its
  `ThemeMode` is read by `MaterialApp.router(themeMode: ...)`. The AppBar's
  `ThemeToggleButton` calls `ThemeController.of(context).toggle()`, which
  calls `setState` — because this is the one thing in the theme layer that
  *changes based on user interaction*, it's the deliberately Stateful piece,
  per the brief's own example.
- **Stateless vs. Stateful, applied literally.** `ProductCard` is
  `StatelessWidget` — per the brief, "a single product card's static
  display" is the canonical Stateless case. The theme toggle is the
  canonical Stateful case. Nothing else in this half needs to hold state.
- **Responsive grid.** `HomeScreen` uses `SliverLayoutBuilder` (the sliver
  form of `LayoutBuilder`) to read the width actually available to the grid
  and picks 2 / 3 / 4 columns at phone / tablet / wide breakpoints.
- **Navigation 2.0.** `app_router.dart` defines the route table with
  `go_router`; tapping a `ProductCard` calls
  `context.push('/product/${product.id}')`.

## What's intentionally left for the next half

`ProductDetailScreen` only resolves the `Product` from the route's `:id` and
shows a placeholder — no image/price/description layout, no Cart, no
Checkout Confirmation yet. Those come with the rest of the user flow.
