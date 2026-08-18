import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

enum ShadButtonVariant { primary, secondary, outline, ghost, destructive, link }
enum ShadButtonSize { small, medium, large, icon }

class ShadButton extends StatelessWidget {
  const ShadButton({super.key, required this.onPressed, required this.child,
    this.variant = ShadButtonVariant.primary, this.size = ShadButtonSize.medium,
    this.leading, this.loading = false});

  final VoidCallback? onPressed;
  final Widget child;
  final ShadButtonVariant variant;
  final ShadButtonSize size;
  final Widget? leading;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final (background, foreground, border) = switch (variant) {
      ShadButtonVariant.primary => (c.primary, c.primaryForeground, c.primary),
      ShadButtonVariant.secondary => (c.muted, c.foreground, c.muted),
      ShadButtonVariant.outline => (Colors.transparent, c.foreground, c.border),
      ShadButtonVariant.ghost => (Colors.transparent, c.foreground, Colors.transparent),
      ShadButtonVariant.destructive => (c.destructive, Colors.white, c.destructive),
      ShadButtonVariant.link => (Colors.transparent, c.foreground, Colors.transparent),
    };
    final (height, horizontal) = switch (size) {
      ShadButtonSize.small => (36.0, 12.0), ShadButtonSize.medium => (40.0, 16.0),
      ShadButtonSize.large => (44.0, 24.0), ShadButtonSize.icon => (40.0, 10.0),
    };
    return SizedBox(
      height: height,
      width: size == ShadButtonSize.icon ? height : null,
      child: TextButton(
        onPressed: loading ? null : onPressed,
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: horizontal)),
          backgroundColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.disabled) ? background.withValues(alpha: .5) : background),
          foregroundColor: WidgetStatePropertyAll(foreground),
          overlayColor: WidgetStatePropertyAll(foreground.withValues(alpha: .08)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: border))),
          textStyle: WidgetStatePropertyAll(const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ),
        child: loading
            ? SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2, color: foreground))
            : Row(mainAxisSize: MainAxisSize.min, children: [if (leading != null) ...[leading!, const SizedBox(width: 8)], Flexible(child: child)]),
      ),
    );
  }
}
