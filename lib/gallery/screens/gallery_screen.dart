import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';
import '../components/gallery_header.dart';
import 'landing_screen.dart';
import 'components_screen.dart';
import 'blocks_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key, required this.onThemeChanged});
  final VoidCallback onThemeChanged;
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int selectedIndex = 0;
  void select(int index) => setState(() => selectedIndex = index);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: GalleryHeader(
                    selectedIndex: selectedIndex,
                    onSelected: select,
                    onThemeChanged: widget.onThemeChanged,
                  ),
                ),
              ),
              const ShadSeparator(),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    page(
                      'home',
                      LandingScreen(
                        onComponents: () => select(1),
                        onBlocks: () => select(2),
                      ),
                    ),
                    page('components', const ComponentsScreen()),
                    page('blocks', const BlocksScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  Widget page(String name, Widget child) => SingleChildScrollView(
    key: PageStorageKey(name),
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        child,
        const SizedBox(height: 36),
        const ShadSeparator(),
        const SizedBox(height: 20),
        Text(
          'Copy the widgets. Own the experience.',
          style: TextStyle(
            color: context.shadColors.mutedForeground,
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}
