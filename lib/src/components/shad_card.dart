import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

class ShadCard extends StatelessWidget {
  const ShadCard({super.key, required this.child, this.title, this.description, this.footer, this.padding = const EdgeInsets.all(24)});
  final Widget child;
  final Widget? title;
  final Widget? description;
  final Widget? footer;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    return DecoratedBox(
      decoration: BoxDecoration(color: c.card, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: padding, child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        if (title != null) DefaultTextStyle(style: TextStyle(color: c.foreground, fontSize: 18, fontWeight: FontWeight.w600), child: title!),
        if (description != null) ...[const SizedBox(height: 6), DefaultTextStyle(style: TextStyle(color: c.mutedForeground, fontSize: 14, height: 1.45), child: description!)],
        if (title != null || description != null) const SizedBox(height: 20),
        child,
        if (footer != null) ...[const SizedBox(height: 20), footer!],
      ])),
    );
  }
}
