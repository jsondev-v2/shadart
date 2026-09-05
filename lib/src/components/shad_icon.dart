import 'package:flutter/material.dart';

import '../theme/shad_theme.dart';

class ShadIcon extends StatelessWidget {
  const ShadIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });
  final IconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? context.shadColors.foreground;
    return Icon(
      icon,
      size: size,
      color: themeColor,
      semanticLabel: semanticLabel,
    );
  }
}
