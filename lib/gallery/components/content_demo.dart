import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class ContentDemo extends StatelessWidget {
  const ContentDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Content'),
    description: const Text('Text, icons, imagery, cards, lists, and grids.'),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShadText('Display text with a semantic component.'),
        const SizedBox(height: 12),
        const Row(
          children: [
            ShadIcon(Icons.auto_awesome, size: 20),
            SizedBox(width: 12),
            ShadIcon(Icons.favorite_outline, size: 20),
            SizedBox(width: 12),
            ShadTooltip(
              message: 'More information',
              child: ShadIcon(Icons.info_outline, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: ShadImage(
            url:
                'https://images.unsplash.com/photo-1519608487953-e999c86e7455?w=900',
            height: 120,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 12),
        const ShadListItem(
          leading: CircleAvatar(child: Text('S')),
          title: Text('List item'),
          subtitle: Text('A compact row with supporting text.'),
          trailing: ShadIcon(Icons.chevron_right),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 116,
          child: ShadGrid(
            itemCount: 4,
            itemBuilder: (context, index) => ShadCard(
              padding: const EdgeInsets.all(12),
              child: Center(child: Text('Tile ${index + 1}')),
            ),
          ),
        ),
      ],
    ),
  );
}
