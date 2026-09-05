import 'package:flutter/material.dart';
import 'package:shadart/src/components/shad_selection_row.dart';

class ShadRadio<T> extends StatelessWidget {
  const ShadRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? label;
  @override
  Widget build(BuildContext context) => ShadSelectionRow(
    label: label,
    control: Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    ),
    onTap: onChanged == null ? null : () => onChanged!(value),
  );
}
