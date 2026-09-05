import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class ActionDemo extends StatelessWidget {
  const ActionDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Actions'),
    description: const Text('Buttons, chips, progress, and loading states.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadTextButton(onPressed: () {}, child: const Text('Text button')),
            ShadOutlineButton(onPressed: () {}, child: const Text('Outline')),
            ShadIconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
              tooltip: 'More actions',
            ),
            ShadFloatingButton(
              onPressed: () {},
              tooltip: 'Add item',
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ShadChip(label: Text('Design')),
            ShadChip(label: Text('Flutter'), onDeleted: null),
            ShadChip(
              label: Text('Selected'),
              selected: true,
              onSelected: _noop,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ShadProgress(value: .7),
        const SizedBox(height: 16),
        const Row(
          children: [
            ShadLoading(),
            SizedBox(width: 12),
            Expanded(child: Text('Loading your workspace...')),
          ],
        ),
      ],
    ),
  );

  static void _noop([dynamic _]) {}
}
