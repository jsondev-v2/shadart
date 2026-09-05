import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadart/shadart.dart';

void main() {
  testWidgets('button invokes callback', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: ShadTheme.light(),
        home: Scaffold(
          body: ShadButton(
            onPressed: () => pressed = true,
            child: const Text('Save'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Save'));
    expect(pressed, isTrue);
  });

  testWidgets(
    'themed button wrappers expose the latest sizing and variant API',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ShadTheme.light(),
          home: Scaffold(
            body: Column(
              children: [
                ShadTextButton(
                  onPressed: () {},
                  size: ShadButtonSize.small,
                  leading: const Icon(Icons.arrow_forward),
                  child: const Text('Read more'),
                ),
                ShadOutlineButton(
                  onPressed: () {},
                  size: ShadButtonSize.large,
                  child: const Text('Outline action'),
                ),
                ShadIconButton(
                  onPressed: () {},
                  variant: ShadButtonVariant.ghost,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Read more'), findsOneWidget);
      expect(find.text('Outline action'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    },
  );

  testWidgets('selected button styling stays visible in light and dark mode', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ShadTheme.light(),
        home: const Scaffold(
          body: ShadButton(
            selected: true,
            variant: ShadButtonVariant.outline,
            onPressed: null,
            child: Text('Selected'),
          ),
        ),
      ),
    );

    final lightButton = tester.widget<TextButton>(find.byType(TextButton));
    expect(
      lightButton.style!.backgroundColor!.resolve({}),
      isNot(Colors.transparent),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ShadTheme.dark(),
        home: const Scaffold(
          body: ShadButton(
            selected: true,
            variant: ShadButtonVariant.outline,
            onPressed: null,
            child: Text('Selected'),
          ),
        ),
      ),
    );

    final darkButton = tester.widget<TextButton>(find.byType(TextButton));
    expect(
      darkButton.style!.backgroundColor!.resolve({}),
      isNot(Colors.transparent),
    );
  });

  testWidgets('card exposes all content regions', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ShadTheme.light(),
        home: const Scaffold(
          body: ShadCard(
            title: Text('Title'),
            description: Text('Description'),
            footer: Text('Footer'),
            child: Text('Content'),
          ),
        ),
      ),
    );
    for (final text in ['Title', 'Description', 'Content', 'Footer']) {
      expect(find.text(text), findsOneWidget);
    }
  });

  testWidgets('theme installs the selected style preset', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ShadTheme.dark(style: AppStyle.luma),
        home: Builder(builder: (context) => Text(context.shadStyle.name.name)),
      ),
    );

    expect(find.text('luma'), findsOneWidget);
    expect(
      Theme.of(
        tester.element(find.text('luma')),
      ).extension<ShadStyle>()!.radius,
      18,
    );
  });
}
