import 'package:flutter/material.dart';

import '../theme/shad_theme.dart';

class ShadProgress extends StatelessWidget {
  const ShadProgress({super.key, this.value});
  final double? value;
  @override
  Widget build(BuildContext context) => LinearProgressIndicator(
    value: value,
    color: context.shadColors.primary,
    backgroundColor: context.shadColors.muted,
  );
}
