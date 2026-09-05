import 'package:flutter/material.dart';

class ShadDivider extends StatelessWidget {
  const ShadDivider({
    super.key,
    this.indent = 0,
    this.endIndent = 0,
    this.height,
    this.thickness,
  });
  final double indent;
  final double endIndent;
  final double? height;
  final double? thickness;

  @override
  Widget build(BuildContext context) => Divider(
    indent: indent,
    endIndent: endIndent,
    height: height,
    thickness: thickness,
  );
}
