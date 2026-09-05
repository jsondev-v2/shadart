import 'package:flutter/material.dart';
import '../components/content_demo.dart';
import '../components/form_demo.dart';
import '../components/action_demo.dart';
import '../components/navigation_demo.dart';
import '../components/feedback_demo.dart';
import '../components/demo_grid.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Components', style: Theme.of(context).textTheme.headlineLarge),
      const SizedBox(height: 8),
      const Text('Every building block, rendered in one place.'),
      const SizedBox(height: 24),
      const DemoGrid(
        children: [
          ContentDemo(),
          FormDemo(),
          ActionDemo(),
          NavigationDemo(),
          FeedbackDemo(),
        ],
      ),
    ],
  );
}
