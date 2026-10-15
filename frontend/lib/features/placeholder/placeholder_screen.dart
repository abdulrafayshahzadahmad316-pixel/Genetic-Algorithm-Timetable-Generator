import 'package:flutter/material.dart';

import '../../widgets/empty_state.dart';
import '../../widgets/page_header.dart';
import '../shell/destinations.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.index});

  final int index;

  static const Map<String, String> _moduleNotes = {
    'Timetable': 'Module 7 delivers the weekly grid, filters and class details.',
    'Courses': 'Module 2 delivers add, edit, delete and search for courses.',
    'Teachers': 'Module 2 delivers the teacher register and availability data.',
    'Rooms': 'Module 2 delivers room capacity, type and slot availability.',
    'Sections': 'Module 2 delivers section groups and their course load.',
    'Time Slots': 'Module 2 delivers the weekly slot definitions.',
    'Constraints': 'Module 3 delivers hard rules and soft penalty weights.',
    'Generate': 'Module 6 delivers Genetic Algorithm settings and execution.',
    'Experiments': 'Module 9 delivers parameter runs and comparison tables.',
    'Reports': 'Module 10 delivers CSV, Excel and conflict reports.',
    'Settings': 'Module 12 delivers settings, tests and documentation.',
  };

  @override
  Widget build(BuildContext context) {
    final destination = kDestinations[index];

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      children: [
        PageHeader(
          overline: destination.group,
          title: destination.label,
          subtitle: 'Part of the SmartSched timetable workspace',
        ),
        const SizedBox(height: 24),
        Card(
          child: EmptyState(
            icon: destination.icon,
            title: '${destination.label} is coming in a later module',
            message: _moduleNotes[destination.label] ??
                'This workspace is already wired into navigation.',
          ),
        ),
      ],
    );
  }
}
