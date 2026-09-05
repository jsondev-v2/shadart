import 'package:flutter/material.dart';

import 'shad_button.dart';

class ShadIconButton extends StatelessWidget {
  const ShadIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.variant = ShadButtonVariant.ghost,
    this.size = ShadButtonSize.icon,
    this.tooltip,
    this.loading = false,
    this.selected = false,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final ShadButtonVariant variant;
  final ShadButtonSize size;
  final String? tooltip;
  final bool loading;
  final bool selected;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip ?? '',
    child: ShadButton(
      onPressed: onPressed,
      variant: variant,
      size: size,
      leading: icon,
      loading: loading,
      selected: selected,
      child: const SizedBox.shrink(),
    ),
  );
}
