import 'package:flutter/material.dart';
import 'package:shadart/src/components/shad_selection_row.dart';

class ShadCheckbox extends StatelessWidget {
  const ShadCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget? label;
  @override
  Widget build(BuildContext context) => ShadSelectionRow(
    label: label,
    control: Checkbox(value: value, onChanged: onChanged),
    onTap: onChanged == null ? null : () => onChanged!(!value),
  );
}
