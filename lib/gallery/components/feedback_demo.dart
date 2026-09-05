import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class FeedbackDemo extends StatefulWidget {
  const FeedbackDemo({super.key});
  @override
  State<FeedbackDemo> createState() => _FeedbackDemoState();
}

class _FeedbackDemoState extends State<FeedbackDemo> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Feedback & overlays'),
    description: const Text(
      'Pickers, dividers, dialogs, and temporary messages.',
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadDatePicker(
              value: selectedDate,
              onChanged: (value) => setState(() => selectedDate = value),
            ),
            ShadTimePicker(
              value: selectedTime,
              onChanged: (value) => setState(() => selectedTime = value),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ShadDivider(),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadButton(
              onPressed: () => ShadDialog.show(
                context: context,
                title: const Text('Confirm action'),
                content: const Text('This dialog is provided by ShadDialog.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              ),
              child: const Text('Open dialog'),
            ),
            ShadButton(
              variant: ShadButtonVariant.outline,
              onPressed: () => ShadSnackbar.show(context, 'Changes saved'),
              child: const Text('Show snackbar'),
            ),
          ],
        ),
      ],
    ),
  );
}
