import 'package:flutter/material.dart';

import '../../core/app_state.dart';
import '../../core/theme/app_colors.dart';
import 'destinations.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required this.state, this.expanded = true});

  final AppState state;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: expanded ? 244 : 76,
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: expanded ? 18 : 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.calendar_month, size: 18, color: Colors.white),
                ),
                if (expanded) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SmartSched', style: theme.textTheme.titleMedium),
                        Text('Timetable Generator', style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: expanded ? 10 : 8),
              children: _buildItems(context),
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: expanded ? 18 : 12,
              vertical: 14,
            ),
            child: expanded
                ? Text('Version 1.0', style: theme.textTheme.labelSmall)
                : const Center(
                    child: Icon(Icons.info_outline, size: 16, color: AppColors.textSecondary),
                  ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    final widgets = <Widget>[];
    String? currentGroup;

    for (var index = 0; index < kDestinations.length; index++) {
      final destination = kDestinations[index];
      if (expanded && destination.group != currentGroup) {
        currentGroup = destination.group;
        widgets.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 8),
            child: Text(
              currentGroup.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        );
      }

      widgets.add(
        _SidebarItem(
          destination: destination,
          selected: state.destinationIndex == index,
          expanded: expanded,
          onTap: () => state.selectDestination(index),
        ),
      );
    }

    return widgets;
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.destination,
    required this.selected,
    required this.expanded,
    required this.onTap,
  });

  final NavDestination destination;
  final bool selected;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? AppColors.primary : AppColors.textSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: selected ? AppColors.primaryTint(0.08) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: expanded ? 12 : 0),
            child: Row(
              mainAxisAlignment: expanded
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(destination.icon, size: 19, color: foreground),
                if (expanded) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      destination.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                        color: selected ? AppColors.primary : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (selected)
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
