import 'package:flutter/material.dart';

class ShadTabs extends StatelessWidget {
  const ShadTabs({super.key, required this.tabs, this.controller});
  final List<Widget> tabs;
  final TabController? controller;
  @override
  Widget build(BuildContext context) =>
      TabBar(controller: controller, tabs: tabs);
}
