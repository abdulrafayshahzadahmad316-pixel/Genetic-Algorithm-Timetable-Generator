import 'package:flutter/material.dart';

import '../../core/app_state.dart';
import '../../core/theme/app_colors.dart';
import 'destinations.dart';

class MobileNavigationBar extends StatelessWidget {
  const MobileNavigationBar({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = mobilePrimaryIndexOf(state.destinationIndex);
    final moreSelected = selectedIndex < 0;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var position = 0; position < mobilePrimaryCount(); position++)
                Expanded(
                  child: _NavItem(
                    destination: kDestinations[
                        destinationIndexOfMobilePrimary(position)],
                    selected: selectedIndex == position,
                    onTap: () => state
                        .selectDestination(destinationIndexOfMobilePrimary(position)),
                  ),
                ),
              Expanded(
                child: _NavItem(
                  destination: const NavDestination(
                    label: 'More',
                    icon: Icons.more_horiz,
                    group: '',
                  ),
                  selected: moreSelected,
                  onTap: () => _showMoreSheet(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 18, 20, 6),
                child: Text(
                  'All sections',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              for (var index = 0; index < kDestinations.length; index++)
                ListTile(
                  leading: Icon(
                    kDestinations[index].icon,
                    size: 20,
                    color: state.destinationIndex == index
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                  title: Text(kDestinations[index].label),
                  trailing: state.destinationIndex == index
                      ? const Icon(Icons.check, size: 18, color: AppColors.primary)
                      : null,
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    state.selectDestination(index);
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final NavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(destination.icon, size: 21, color: color),
          const SizedBox(height: 4),
          Text(
            destination.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
