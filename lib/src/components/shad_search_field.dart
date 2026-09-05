import 'package:flutter/material.dart';

class ShadSearchField extends StatelessWidget {
  const ShadSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onSubmitted,
  });
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  @override
  Widget build(BuildContext context) => SearchBar(
    controller: controller,
    hintText: hintText,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    leading: const Icon(Icons.search),
  );
}
