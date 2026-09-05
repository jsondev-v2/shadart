import 'package:flutter/material.dart';

class ShadText extends StatelessWidget {
  const ShadText(this.data, {super.key, this.style, this.textAlign});
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) =>
      Text(data, style: style, textAlign: textAlign);
}
