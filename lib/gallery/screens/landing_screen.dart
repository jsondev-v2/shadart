import 'package:flutter/material.dart';
import '../blocks/hero_block.dart';
import '../components/demo_grid.dart';
import '../components/buttons_demo.dart';
import '../components/project_demo.dart';
import '../components/status_demo.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
    required this.onComponents,
    required this.onBlocks,
  });
  final VoidCallback onComponents;
  final VoidCallback onBlocks;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HeroBlock(onComponents: onComponents, onBlocks: onBlocks),
      const SizedBox(height: 48),
      const DemoGrid(
        columns: 3,
        children: [ButtonsDemo(), ProjectDemo(), StatusDemo()],
      ),
    ],
  );
}
