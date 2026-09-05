import 'package:flutter/material.dart';

class ShadBottomNavigation extends StatelessWidget {
  const ShadBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    required this.onDestinationSelected,
  });
  final int selectedIndex;
  final List<NavigationDestination> destinations;
  final ValueChanged<int> onDestinationSelected;
  @override
  Widget build(BuildContext context) => NavigationBar(
    selectedIndex: selectedIndex,
    destinations: destinations,
    onDestinationSelected: onDestinationSelected,
  );
}
