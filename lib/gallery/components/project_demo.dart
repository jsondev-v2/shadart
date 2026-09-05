import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class ProjectDemo extends StatelessWidget {
  const ProjectDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Create project'),
    description: const Text('Deploy a new project in one click.'),
    child: Column(
      children: [
        const ShadInput(label: 'Project name', hintText: 'my-awesome-app'),
        const SizedBox(height: 16),
        const ShadInput(
          label: 'Framework',
          hintText: 'Flutter',
          suffix: Icon(Icons.unfold_more, size: 17),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton(
              variant: ShadButtonVariant.ghost,
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            ShadButton(onPressed: () {}, child: const Text('Deploy')),
          ],
        ),
      ],
    ),
  );
}
