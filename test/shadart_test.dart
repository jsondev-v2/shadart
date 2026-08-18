import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadart/shadart.dart';

void main() {
  testWidgets('button invokes callback', (tester) async {
    var pressed = false;
    await tester.pumpWidget(MaterialApp(theme: ShadTheme.light(), home: Scaffold(body: ShadButton(onPressed: () => pressed = true, child: const Text('Save')))));
    await tester.tap(find.text('Save'));
    expect(pressed, isTrue);
  });

  testWidgets('card exposes all content regions', (tester) async {
    await tester.pumpWidget(MaterialApp(theme: ShadTheme.light(), home: const Scaffold(body: ShadCard(title: Text('Title'), description: Text('Description'), footer: Text('Footer'), child: Text('Content')))));
    for (final text in ['Title', 'Description', 'Content', 'Footer']) {
      expect(find.text(text), findsOneWidget);
    }
  });
}
