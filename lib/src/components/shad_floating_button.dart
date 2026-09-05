import 'package:flutter/material.dart';

class ShadFloatingButton extends StatelessWidget {
  const ShadFloatingButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
  });
  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: onPressed,
    tooltip: tooltip,
    child: child,
  );
}
