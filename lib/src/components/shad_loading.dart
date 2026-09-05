import 'package:flutter/material.dart';

import '../theme/shad_theme.dart';

class ShadLoading extends StatelessWidget {
  const ShadLoading({super.key, this.size = 24, this.strokeWidth = 2});
  final double size;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: CircularProgressIndicator(
      strokeWidth: strokeWidth,
      color: context.shadColors.primary,
      backgroundColor: context.shadColors.muted,
    ),
  );
}
