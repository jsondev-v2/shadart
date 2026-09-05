import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

enum ShadAlertVariant { normal, destructive }

class ShadAlert extends StatelessWidget {
  const ShadAlert({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.action,
    this.variant = ShadAlertVariant.normal,
  });
  final Widget title;
  final Widget? description;
  final Widget? icon;
  final Widget? action;
  final ShadAlertVariant variant;
  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final color = variant == ShadAlertVariant.destructive
        ? c.destructive
        : c.foreground;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: variant == ShadAlertVariant.destructive
              ? c.destructive.withValues(alpha: .6)
              : c.border,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(color: color, size: 18),
              child: icon!,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  child: title,
                ),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: variant == ShadAlertVariant.destructive
                          ? color
                          : c.mutedForeground,
                      fontSize: 13,
                      height: 1.4,
                    ),
                    child: description!,
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[const SizedBox(width: 12), action!],
        ],
      ),
    );
  }
}
