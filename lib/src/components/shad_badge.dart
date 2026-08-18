import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

enum ShadBadgeVariant { primary, secondary, outline, destructive }

class ShadBadge extends StatelessWidget {
  const ShadBadge({super.key, required this.child, this.variant = ShadBadgeVariant.primary});
  final Widget child;
  final ShadBadgeVariant variant;
  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final (bg, fg, edge) = switch (variant) {
      ShadBadgeVariant.primary => (c.primary, c.primaryForeground, c.primary),
      ShadBadgeVariant.secondary => (c.muted, c.foreground, c.muted),
      ShadBadgeVariant.outline => (Colors.transparent, c.foreground, c.border),
      ShadBadgeVariant.destructive => (c.destructive, Colors.white, c.destructive),
    };
    return Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: bg, border: Border.all(color: edge), borderRadius: BorderRadius.circular(999)),
      child: DefaultTextStyle(style: TextStyle(color: fg, fontSize: 12, fontWeight: FontWeight.w600), child: child));
  }
}
