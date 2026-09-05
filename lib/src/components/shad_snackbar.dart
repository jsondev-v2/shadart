import 'package:flutter/material.dart';

abstract final class ShadSnackbar {
  static void show(
    BuildContext context,
    String message, {
    SnackBarAction? action,
  }) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message), action: action));
}
