import 'package:flutter/material.dart';

import 'shad_button.dart';

class ShadTextButton extends StatelessWidget {
  const ShadTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = ShadButtonVariant.link,
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
  Widget build(BuildContext context) => ShadButton(
    onPressed: onPressed,
    variant: variant,
    size: size,
    leading: leading,
    loading: loading,
    selected: selected,
    child: child,
  );
}
