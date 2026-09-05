import 'package:flutter/material.dart';

class DemoGrid extends StatelessWidget {
  const DemoGrid({super.key, required this.children, this.columns = 2});
  final List<Widget> children;
  final int columns;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) {
      final count = box.maxWidth < 760 ? 1 : columns;
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          for (final child in children)
            SizedBox(
              width: (box.maxWidth - 20 * (count - 1)) / count,
              child: child,
            ),
        ],
      );
    },
  );
}
