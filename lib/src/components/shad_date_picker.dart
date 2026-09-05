import 'package:flutter/material.dart';

class ShadDatePicker extends StatelessWidget {
  const ShadDatePicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.firstDate,
    this.lastDate,
    this.label = 'Select date',
  });
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String label;
  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: () async {
      final selected = await showDatePicker(
        context: context,
        initialDate: value ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1900),
        lastDate: lastDate ?? DateTime(2100),
      );
      if (selected != null) onChanged(selected);
    },
    icon: const Icon(Icons.calendar_today_outlined),
    label: Text(
      value == null
          ? label
          : MaterialLocalizations.of(context).formatMediumDate(value!),
    ),
  );
}
