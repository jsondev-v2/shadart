import 'package:flutter/material.dart';

class ShadDropdown<T> extends StatelessWidget {
  const ShadDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
  });
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final Widget? hint;
  @override
  Widget build(BuildContext context) => DropdownButtonFormField<T>(
    initialValue: value,
    items: items,
    onChanged: onChanged,
    hint: hint,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );
}
