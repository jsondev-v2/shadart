import 'package:flutter/material.dart';

class ShadGrid extends StatelessWidget {
  const ShadGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.spacing = 8,
  });
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final int crossAxisCount;
  final double spacing;
  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: itemCount,
    itemBuilder: itemBuilder,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
    ),
  );
}
