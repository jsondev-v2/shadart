import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class StatusDemo extends StatelessWidget {
  const StatusDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Feedback'),
    description: const Text('Communicate status with clarity.'),
    child: Column(
      children: [
        const ShadAlert(
          icon: Icon(Icons.check_circle_outline),
          title: Text('Project deployed'),
          description: Text('Your project is now live and ready to visit.'),
        ),
        const SizedBox(height: 14),
        const ShadAlert(
          variant: ShadAlertVariant.destructive,
          icon: Icon(Icons.error_outline),
          title: Text('Something went wrong'),
          description: Text('Check the fields and try again.'),
        ),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadBadge(child: Text('New')),
            ShadBadge(variant: ShadBadgeVariant.secondary, child: Text('Beta')),
            ShadBadge(variant: ShadBadgeVariant.outline, child: Text('Draft')),
          ],
        ),
      ],
    ),
  );
}
