# Dialing Screen — Flutter Static Layout

A static recreation of a mobile "Dialing" call screen, built with core Flutter
widgets (`Container`, `Row`, `Column`, `Text`, `Icon`, `Stack`, `Scaffold`) —
no external UI packages.

## Layout breakdown
- **Header** — "Dialing" label at the top (`Text` inside a `Column`)
- **Avatar** — three concentric `Container` circles (`Stack` + `BoxDecoration`)
  simulating the pulsing ring effect around the profile photo
- **Contact info** — name and phone number (`Text` widgets)
- **Divider** — thin `Container` used as a horizontal rule
- **Call options row** — Mute / Bluetooth / Hold (`Row` of `Icon` + `Text` columns)
- **Action row** — keypad icon, circular call button, speaker icon (`Row`)

## Palette
| Element               | Color     |
|------------------------|-----------|
| Accent (rings, button) | `#2FBEEA` |
| Title / name text      | `#1B1B2F` |
| Secondary text/icons   | `#6E6E73` |
| Divider                | `#E3E3E8` |
| Background             | `#FFFFFF` |

## Run it
\`\`\`bash
flutter pub get
flutter run
\`\`\`

## Note
The avatar currently uses a placeholder `Icon`. Swap it for `Image.asset(...)`
or `Image.network(...)` inside the `ClipOval` in `_buildAvatarWithRings()`
to use an actual photo.