import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Buttons'),
    description: const Text('Actions for every level of emphasis.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShadButton(onPressed: () {}, child: const Text('Primary action')),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.secondary,
          onPressed: () {},
          child: const Text('Secondary'),
        ),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.outline,
          onPressed: () {},
          child: const Text('Outline'),
        ),
        const SizedBox(height: 10),
        ShadButton(
          variant: ShadButtonVariant.destructive,
          onPressed: () {},
          child: const Text('Delete project'),
        ),
      ],
    ),
  );
}
