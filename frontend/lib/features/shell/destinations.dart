import 'package:flutter/material.dart';

class NavDestination {
  const NavDestination({
    required this.label,
    required this.icon,
    required this.group,
    this.mobilePrimary = false,
  });

  final String label;
  final IconData icon;
  final String group;
  final bool mobilePrimary;
}

const List<NavDestination> kDestinations = [
  NavDestination(
    label: 'Dashboard',
    icon: Icons.dashboard_outlined,
    group: 'Overview',
    mobilePrimary: true,
  ),
  NavDestination(
    label: 'Timetable',
    icon: Icons.calendar_view_week_outlined,
    group: 'Scheduling',
    mobilePrimary: true,
  ),
  NavDestination(
    label: 'Courses',
    icon: Icons.menu_book_outlined,
    group: 'Academic Data',
  ),
  NavDestination(
    label: 'Teachers',
    icon: Icons.school_outlined,
    group: 'Academic Data',
  ),
  NavDestination(
    label: 'Rooms',
    icon: Icons.meeting_room_outlined,
    group: 'Academic Data',
  ),
  NavDestination(
    label: 'Sections',
    icon: Icons.groups_outlined,
    group: 'Academic Data',
  ),
  NavDestination(
    label: 'Time Slots',
    icon: Icons.schedule_outlined,
    group: 'Academic Data',
  ),
  NavDestination(
    label: 'Constraints',
    icon: Icons.tune_outlined,
    group: 'Scheduling',
  ),
  NavDestination(
    label: 'Generate',
    icon: Icons.play_circle_outline,
    group: 'Scheduling',
    mobilePrimary: true,
  ),
  NavDestination(
    label: 'Experiments',
    icon: Icons.science_outlined,
    group: 'Analysis',
  ),
  NavDestination(
    label: 'Reports',
    icon: Icons.assessment_outlined,
    group: 'Analysis',
    mobilePrimary: true,
  ),
  NavDestination(
    label: 'Settings',
    icon: Icons.settings_outlined,
    group: 'System',
  ),
];

int mobilePrimaryCount() => kDestinations.where((d) => d.mobilePrimary).length;

bool isMobilePrimaryIndex(int index) => kDestinations[index].mobilePrimary;

int mobilePrimaryIndexOf(int index) {
  final primaries =
      kDestinations.asMap().entries.where((entry) => entry.value.mobilePrimary);
  final position = primaries.toList().indexWhere((entry) => entry.key == index);
  return position < 0 ? -1 : position;
}

int destinationIndexOfMobilePrimary(int position) {
  final indexes = kDestinations.asMap().entries
      .where((entry) => entry.value.mobilePrimary)
      .map((entry) => entry.key)
      .toList(growable: false);
  if (position < 0 || position >= indexes.length) return 0;
  return indexes[position];
}
