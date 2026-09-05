import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

class ShadCard extends StatelessWidget {
  const ShadCard({
    super.key,
    required this.child,
    this.title,
    this.description,
    this.footer,
    this.padding = const EdgeInsets.all(24),
  });
  final Widget child;
  final Widget? title;
  final Widget? description;
  final Widget? footer;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final style = context.shadStyle;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.card,
        border: Border.all(color: c.border, width: style.borderWidth),
        borderRadius: BorderRadius.circular(style.radius),
        boxShadow: style.elevation == 0
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08),
                  blurRadius: style.elevation * 4,
                  offset: Offset(0, style.elevation),
                ),
              ],
      ),
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              DefaultTextStyle(
                style: TextStyle(
                  color: c.foreground,
                  fontSize: style.fontSize + 4,
                  fontWeight: FontWeight.w600,
                ),
                child: title!,
              ),
            if (description != null) ...[
              SizedBox(height: style.spacing / 2),
              DefaultTextStyle(
                style: TextStyle(
                  color: c.mutedForeground,
                  fontSize: style.fontSize,
                  height: 1.45,
                ),
                child: description!,
              ),
            ],
            if (title != null || description != null)
              SizedBox(height: style.spacing),
            child,
            if (footer != null) ...[SizedBox(height: style.spacing), footer!],
          ],
        ),
      ),
    );
  }
}
