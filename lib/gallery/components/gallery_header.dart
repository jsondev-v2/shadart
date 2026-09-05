import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.onThemeChanged,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onThemeChanged;
  @override
  Widget build(BuildContext context) => Wrap(
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 24,
    runSpacing: 16,
    children: [
      const Text(
        'shadart',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
      Wrap(
        spacing: 4,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (var i = 0; i < 3; i++)
            ShadButton(
              variant: selectedIndex == i
                  ? ShadButtonVariant.secondary
                  : ShadButtonVariant.ghost,
              onPressed: () => onSelected(i),
              child: Text(['Home', 'Components', 'Blocks'][i]),
            ),
          Tooltip(
            message: 'Toggle theme',
            child: ShadButton(
              variant: ShadButtonVariant.ghost,
              size: ShadButtonSize.icon,
              onPressed: onThemeChanged,
              child: const Icon(Icons.contrast, size: 18),
            ),
          ),
        ],
      ),
    ],
  );
}
