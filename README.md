# PLN Mobile Design System

A reusable Flutter design system package that centralizes visual styling, theming, and UI components for PLN Mobile apps.

This package helps teams build consistent, scalable, and maintainable UI by providing a single source of truth for design tokens and reusable widgets.

---

## ✨ Features

### 🎨 Design Tokens
Centralized visual foundation for consistent UI:
- Color palette (brand & semantic colors)
- Typography (font family & text styles)
- Spacing system
- Border radius

### 🧩 Theming
- Preconfigured light theme
- Easy ThemeData integration
- Consistent visual language across screens

### 🖼️ Asset Management
- Image asset paths
- SVG asset paths
- Lottie animation paths
- Font asset configuration

### 🧱 Reusable Widgets
Production-ready UI components:
- Buttons
- Cards
- App bars
- Input fields
- Sheets / dialogs
- Indicators
- And more

### 🛠️ Utilities
Helper tools for common UI needs:
- Screen size helpers
- Responsive scaling utilities
- Formatters
- Validators
- BuildContext extensions

---

## 📦 Installation

### Option 1 — Local Path (for active development)

```yaml
dependencies:
  pln_mobile_design_system:
    path: ../pln_mobile_design_system
```

### Option 2 — Git Repository (recommended for teams)

```yaml
dependencies:
  pln_mobile_design_system:
    git:
      url: https://gitlab.com/your-group/pln_mobile_design_system.git
      ref: v1.0.0
```

## 📁 Package Structure

```text
lib/
├─ assets/
│  ├─ animations/
│  │  └─ app_animations.dart
│  ├─ icons/
│  │  └─ app_icons.dart
│  ├─ images/
│  │  └─ app_images.dart
│  ├─ sounds/
│  │  └─ app_sounds.dart
│  └─ app_assets.dart
│
├─ constants/
│  ├─ colors/
│  │  ├─ app_colors.dart
│  │  └─ app_palette.dart
│  ├─ app_radius.dart
│  └─ app_spacing.dart
│
├─ theme/
│  └─ app_theme.dart
│
├─ typography/
│  ├─ app_font_size.dart
│  ├─ app_font_weight.dart
│  ├─ app_fonts.dart
│  ├─ app_line_height.dart
│  ├─ app_text_styles.dart
│  └─ app_text_theme.dart
│
├─ utils/
│  ├─ extensions/
│  │  └─ context_extension.dart
│  └─ formatters/
│     └─ name_input_formatters.dart
│
├─ widgets/
│  ├─ dialogs/
│  └─ sheets/
│
└─ pln_mobile_design_system.dart
```