import 'package:flutter/material.dart';

import '../theme/shad_theme.dart';

class ShadChip extends StatelessWidget {
  const ShadChip({
    super.key,
    required this.label,
    this.onDeleted,
    this.avatar,
    this.onSelected,
    this.selected = false,
  });
  final Widget label;
  final VoidCallback? onDeleted;
  final Widget? avatar;
  final ValueChanged<bool>? onSelected;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final labelStyle = TextStyle(
      color: selected ? c.primaryForeground : c.foreground,
    );

    if (onSelected == null) {
      return Chip(
        label: DefaultTextStyle.merge(style: labelStyle, child: label),
        onDeleted: onDeleted,
        avatar: avatar,
      );
    }

    return FilterChip(
      label: DefaultTextStyle.merge(
        style: selected ? TextStyle(color: c.primaryForeground) : labelStyle,
        child: label,
      ),
      onDeleted: onDeleted,
      avatar: avatar,
      selected: selected,
      onSelected: onSelected,
      selectedColor: c.primary,
      backgroundColor: c.muted,
      side: BorderSide(color: selected ? c.primary : c.border),
    );
  }
}
