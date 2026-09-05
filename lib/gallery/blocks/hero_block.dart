import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class HeroBlock extends StatelessWidget {
  const HeroBlock({
    super.key,
    required this.onComponents,
    required this.onBlocks,
  });
  final VoidCallback onComponents;
  final VoidCallback onBlocks;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadBadge(
          variant: ShadBadgeVariant.secondary,
          child: Text('Flutter UI components'),
        ),
        const SizedBox(height: 24),
        Text(
          'Build beautiful apps\nwithout fighting the defaults.',
          style: TextStyle(
            fontSize: box.maxWidth < 600 ? 36 : 56,
            height: 1.08,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Customizable widgets and ready-to-use blocks inspired by shadcn/ui. Designed for Flutter. Made to be yours.',
          style: TextStyle(
            color: context.shadColors.mutedForeground,
            fontSize: 17,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ShadButton(
              onPressed: onComponents,
              child: const Text('Explore components'),
            ),
            ShadButton(
              onPressed: onBlocks,
              variant: ShadButtonVariant.outline,
              child: const Text('Browse blocks'),
            ),
          ],
        ),
      ],
    ),
  );
}
