import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

enum ShadButtonVariant { primary, secondary, outline, ghost, destructive, link }

enum ShadButtonSize { small, medium, large, icon }

class ShadButton extends StatelessWidget {
  const ShadButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = ShadButtonVariant.primary,
    this.size = ShadButtonSize.medium,
    this.leading,
    this.loading = false,
    this.selected = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ShadButtonVariant variant;
  final ShadButtonSize size;
  final Widget? leading;
  final bool loading;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final style = context.shadStyle;
    final brightness = Theme.of(context).brightness;
    final selectedTint = brightness == Brightness.dark
        ? c.primary.withValues(alpha: 0.18)
        : c.primary.withValues(alpha: 0.12);
    final (background, foreground, border) = switch (variant) {
      ShadButtonVariant.primary => (c.primary, c.primaryForeground, c.primary),
      ShadButtonVariant.secondary => (c.muted, c.foreground, c.muted),
      ShadButtonVariant.outline => (
        selected ? selectedTint : Colors.transparent,
        c.foreground,
        selected ? c.primary : c.border,
      ),
      ShadButtonVariant.ghost => (
        selected ? selectedTint : Colors.transparent,
        c.foreground,
        Colors.transparent,
      ),
      ShadButtonVariant.destructive => (
        selected ? c.destructive.withValues(alpha: 0.9) : c.destructive,
        Colors.white,
        c.destructive,
      ),
      ShadButtonVariant.link => (
        selected ? selectedTint : Colors.transparent,
        c.foreground,
        Colors.transparent,
      ),
    };
    final (height, horizontal) = switch (size) {
      ShadButtonSize.small => (style.controlHeight - 4, style.spacing),
      ShadButtonSize.medium => (style.controlHeight, style.spacing + 4),
      ShadButtonSize.large => (style.controlHeight + 4, style.spacing + 8),
      ShadButtonSize.icon => (style.controlHeight, style.spacing - 2),
    };
    final hasTextContent =
        !(child is SizedBox &&
            (child as SizedBox).width == 0 &&
            (child as SizedBox).height == 0);

    return SizedBox(
      height: height,
      width: size == ShadButtonSize.icon ? height : null,
      child: TextButton(
        onPressed: loading ? null : onPressed,
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: horizontal),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.disabled)
                ? background.withValues(alpha: .5)
                : selected || s.contains(WidgetState.selected)
                ? selectedTint
                : background,
          ),
          foregroundColor: WidgetStatePropertyAll(foreground),
          overlayColor: WidgetStatePropertyAll(
            selected ? selectedTint : foreground.withValues(alpha: .08),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(style.radius),
              side: BorderSide(color: border, width: style.borderWidth),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: style.fontSize, fontWeight: FontWeight.w600),
          ),
        ),
        child: loading
            ? SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foreground,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[
                    leading!,
                    if (hasTextContent) SizedBox(width: style.spacing / 2),
                  ],
                  if (hasTextContent) child,
                ],
              ),
      ),
    );
  }
}
