import 'package:flutter/material.dart';
import '../theme/shad_theme.dart';

class ShadInput extends StatelessWidget {
  const ShadInput({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final c = context.shadColors;
    final style = context.shadStyle;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(style.radius),
      borderSide: BorderSide(color: c.border, width: style.borderWidth),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              color: c.foreground,
              fontSize: style.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: style.spacing / 2),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            color: c.foreground,
            fontSize: style.fontSize,
            letterSpacing: style.letterSpacing,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefix,
            suffixIcon: suffix,
            isDense: true,
            filled: true,
            fillColor: c.background,
            contentPadding: EdgeInsets.symmetric(
              horizontal: style.spacing,
              vertical: (style.controlHeight - 20) / 2,
            ),
            hintStyle: TextStyle(
              color: c.mutedForeground,
              fontSize: style.fontSize,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(color: c.foreground, width: 1.5),
            ),
            errorBorder: border.copyWith(
              borderSide: BorderSide(color: c.destructive),
            ),
            focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: c.destructive, width: 1.5),
            ),
            errorText: errorText,
            helperText: helperText,
            helperStyle: TextStyle(color: c.mutedForeground),
            errorStyle: TextStyle(color: c.destructive),
          ),
        ),
      ],
    );
  }
}
