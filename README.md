# Shadart

A dependency-free, shadcn-inspired UI kit for Flutter. Shadart provides quiet
visual defaults, semantic color tokens, light and dark themes, and composable
widgets that still feel native to Flutter.

## Install

Until the package is published, reference the GitHub repository:

```yaml
dependencies:
  shadart:
    git:
      url: https://github.com/your-username/shadart.git
```

## Use

```dart
import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

MaterialApp(
  theme: ShadTheme.light(),
  darkTheme: ShadTheme.dark(),
  home: Scaffold(
    body: ShadCard(
      title: const Text('Create project'),
      description: const Text('Start with a clean workspace.'),
      child: Column(
        children: [
          const ShadInput(label: 'Name', hintText: 'Acme'),
          ShadButton(onPressed: () {}, child: const Text('Create')),
        ],
      ),
    ),
  ),
);
```

## Components

- `ShadButton` — primary, secondary, outline, ghost, destructive, and link variants
- `ShadCard` — structured title, description, content, and footer regions
- `ShadInput` — labeled form input with helper and error states
- `ShadBadge` — compact status labels in four variants
- `ShadAlert` — contextual messages with optional icon and action
- `ShadSeparator` — horizontal or vertical visual division

Run `flutter run -d chrome` to browse the included responsive component gallery.

## Publishing

Replace the placeholder GitHub URLs in `pubspec.yaml` and this README, then run:

```shell
flutter analyze
flutter test
dart pub publish --dry-run
```

Shadart is not affiliated with shadcn. The design language is inspired by the
same principles: neutral surfaces, clear hierarchy, and copy-friendly APIs.
