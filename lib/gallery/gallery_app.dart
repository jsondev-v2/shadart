import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';
import 'screens/gallery_screen.dart';

class ShadartGallery extends StatefulWidget {
  const ShadartGallery({super.key});
  @override
  State<ShadartGallery> createState() => _ShadartGalleryState();
}

class _ShadartGalleryState extends State<ShadartGallery> {
  ThemeMode mode = ThemeMode.system;
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Shadart',
    theme: ShadTheme.light(colorScheme: AppColorScheme.neutral),
    darkTheme: ShadTheme.dark(colorScheme: AppColorScheme.neutral),
    themeMode: mode,
    home: GalleryScreen(
      onThemeChanged: () => setState(() {
        final dark =
            mode == ThemeMode.dark ||
            (mode == ThemeMode.system &&
                WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark);
        mode = dark ? ThemeMode.light : ThemeMode.dark;
      }),
    ),
  );
}
