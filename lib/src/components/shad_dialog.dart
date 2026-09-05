import 'package:flutter/material.dart';

abstract final class ShadDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget title,
    required Widget content,
    List<Widget>? actions,
  }) => showDialog<T>(
    context: context,
    builder: (context) =>
        AlertDialog(title: title, content: content, actions: actions),
  );
}
