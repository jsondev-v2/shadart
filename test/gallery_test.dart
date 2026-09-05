import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadart/gallery/gallery_app.dart';
import 'package:shadart/gallery/components/gallery_header.dart';
import 'package:shadart/gallery/components/form_demo.dart';
import 'package:shadart/gallery/blocks/blocks_showcase.dart';

void main() {
  Future<void> start(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    // Seed the existing photo demo so gallery checks do not require a network.
    final recorder = ui.PictureRecorder();
    Canvas(recorder).drawColor(Colors.grey, BlendMode.src);
    final picture = recorder.endRecording();
    final image = await tester.runAsync(() => picture.toImage(1, 1));
    picture.dispose();
    const photo = NetworkImage(
      'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=900',
    );
    PaintingBinding.instance.imageCache.putIfAbsent(
      photo,
      () =>
          OneFrameImageStreamCompleter(Future.value(ImageInfo(image: image!))),
    );
    await tester.pumpWidget(const ShadartGallery());
    await tester.pump();
  }

  Finder nav(String text) => find.descendant(
    of: find.byType(GalleryHeader),
    matching: find.text(text),
  );

  for (final width in [375.0, 1280.0]) {
    testWidgets('gallery navigation and layout at $width', (tester) async {
      await start(tester, Size(width, 900));
      expect(find.text('Explore components'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('Explore components'));
      await tester.pump();
      expect(find.byType(FormDemo), findsOneWidget);
      final field = find
          .descendant(
            of: find.byType(FormDemo),
            matching: find.byType(TextField),
          )
          .first;
      await tester.enterText(field, 'My workspace');
      await tester.tap(nav('Blocks'));
      await tester.pump();
      expect(find.byType(BlocksShowcase), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(nav('Components'));
      await tester.pump();
      expect(find.text('My workspace'), findsOneWidget);
      await tester.tap(nav('Home'));
      await tester.pump();
      await tester.tap(find.text('Browse blocks'));
      await tester.pump();
      expect(find.byType(BlocksShowcase), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('theme toggle switches from system dark to light', (
    tester,
  ) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await start(tester, const Size(1280, 900));
    await tester.tap(find.byTooltip('Toggle theme'));
    await tester.pump(const Duration(milliseconds: 300));
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.light,
    );
    expect(tester.takeException(), isNull);
  });
}
