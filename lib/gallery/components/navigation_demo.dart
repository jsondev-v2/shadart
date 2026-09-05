import 'package:flutter/material.dart';
import 'package:shadart/shadart.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});
  @override
  Widget build(BuildContext context) => ShadCard(
    title: const Text('Navigation'),
    description: const Text('Headers, tabs, lists, and bottom navigation.'),
    padding: EdgeInsets.zero,
    child: Column(
      children: [
        const ShadAppBar(
          title: Text('Workspace'),
          leading: ShadIcon(Icons.menu),
          actions: [
            ShadIconButton(onPressed: _noop, icon: ShadIcon(Icons.search)),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    ShadTabs(
                      tabs: [
                        Tab(text: 'Overview'),
                        Tab(text: 'Activity'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ShadListItem(
                title: Text('Recent activity'),
                trailing: ShadIcon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        ShadBottomNavigation(
          selectedIndex: 0,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: _noop,
        ),
      ],
    ),
  );

  static void _noop([dynamic _]) {}
}
