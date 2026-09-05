import 'package:flutter/material.dart';

class ShadAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShadAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
  });
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) =>
      AppBar(title: title, leading: leading, actions: actions, bottom: bottom);
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
