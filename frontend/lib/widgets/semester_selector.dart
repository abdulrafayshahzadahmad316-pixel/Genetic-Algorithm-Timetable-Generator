import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../models/semester.dart';

class SemesterSelector extends StatelessWidget {
  const SemesterSelector({
    super.key,
    required this.semesters,
    required this.selected,
    required this.onChanged,
    this.compact = false,
  });

  final List<Semester> semesters;
  final Semester? selected;
  final ValueChanged<Semester?> onChanged;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (semesters.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 10 : 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!compact) ...[
            const Icon(Icons.event_note_outlined, size: 16, color: AppColors.secondary),
            const SizedBox(width: 8),
          ],
          DropdownButton<Semester>(
            value: selected,
            isDense: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.expand_more, size: 20, color: AppColors.secondary),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            items: semesters
                .map(
                  (semester) => DropdownMenuItem<Semester>(
                    value: semester,
                    child: Text(semester.label),
                  ),
                )
                .toList(growable: false),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
