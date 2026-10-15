import 'package:flutter/material.dart';

import '../../core/app_state.dart';
import '../dashboard/dashboard_screen.dart';
import '../placeholder/placeholder_screen.dart';
import 'destinations.dart';
import 'mobile_nav_bar.dart';
import 'sidebar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= 640) {
          final expanded = width >= 1000;
          return Row(
            children: [
              Sidebar(state: state, expanded: expanded),
              const VerticalDivider(width: 1),
              Expanded(child: _content()),
            ],
          );
        }

        return Column(
          children: [
            Expanded(child: _content()),
            MobileNavigationBar(state: state),
          ],
        );
      },
    );
  }

  Widget _content() {
    return AnimatedBuilder(
      animation: state,
      builder: (context, _) {
        return IndexedStack(
          index: state.destinationIndex,
          children: [
            for (var index = 0; index < kDestinations.length; index++)
              index == 0
                  ? DashboardScreen(state: state)
                  : PlaceholderScreen(index: index),
          ],
        );
      },
    );
  }
}
