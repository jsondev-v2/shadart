import 'package:flutter/material.dart';

class ShadTimePicker extends StatelessWidget {
  const ShadTimePicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = 'Select time',
  });
  final TimeOfDay? value;
  final ValueChanged<TimeOfDay?> onChanged;
  final String label;
  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: () async {
      final selected = await showTimePicker(
        context: context,
        initialTime: value ?? TimeOfDay.now(),
      );
      if (selected != null) onChanged(selected);
    },
    icon: const Icon(Icons.schedule_outlined),
    label: Text(value == null ? label : value!.format(context)),
  );
}
