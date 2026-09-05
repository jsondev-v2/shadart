import 'package:flutter/material.dart';

class ShadSelectionRow extends StatelessWidget {
  const ShadSelectionRow({
    required this.control,
    required this.label,
    required this.onTap,
  });
  final Widget control;
  final Widget? label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        control,
        if (label != null) Flexible(child: label!),
      ],
    ),
  );
}
