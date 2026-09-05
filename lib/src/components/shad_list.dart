import 'package:flutter/material.dart';

class ShadList<T> extends StatelessWidget {
  const ShadList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.physics,
  });
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: itemCount,
    itemBuilder: itemBuilder,
    shrinkWrap: shrinkWrap,
    physics: physics,
  );
}
