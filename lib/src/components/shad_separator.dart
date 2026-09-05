import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

class ShadSeparator extends StatelessWidget {
  const ShadSeparator({
    super.key,
    this.axis = Axis.horizontal,
    this.margin = EdgeInsets.zero,
  });
  final Axis axis;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) => Padding(
    padding: margin,
    child: Container(
      width: axis == Axis.horizontal ? double.infinity : 1,
      height: axis == Axis.horizontal ? 1 : double.infinity,
      color: context.shadColors.border,
    ),
  );
}
