import 'package:flutter/material.dart';

class ShadTooltip extends StatelessWidget {
  const ShadTooltip({super.key, required this.message, required this.child});
  final String message;
  final Widget child;
  @override
  Widget build(BuildContext context) => Tooltip(message: message, child: child);
}
