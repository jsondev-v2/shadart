# Shadart

A dependency-free, shadcn-inspired UI kit for Flutter. Shadart provides quiet
visual defaults, semantic color tokens, light and dark themes, and composable
widgets that still feel native to Flutter.

## Install

Install directly from the public GitHub repository:

```yaml
dependencies:
  shadart:
    git:
      url: https://github.com/jsondev-v2/shadart.git
      ref: main
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

Then run `flutter pub get` and import `package:shadart/shadart.dart`.

## Versioned installation

For production projects, use a release tag instead of `main`:

```yaml
dependencies:
  shadart:
    git:
      url: https://github.com/jsondev-v2/shadart.git
      ref: v0.1.0
```

## Publishing to pub.dev

```shell
flutter analyze
flutter test
dart pub publish --dry-run
dart pub publish
```

After publication, projects can install it with `flutter pub add shadart`.

Shadart is not affiliated with shadcn. The design language is inspired by the
same principles: neutral surfaces, clear hierarchy, and copy-friendly APIs.
