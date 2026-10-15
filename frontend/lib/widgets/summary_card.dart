import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.caption,
    this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? caption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTint(0.08),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(icon, size: 17, color: AppColors.primary),
                  ),
                  const Spacer(),
                  if (caption != null)
                    Text(caption!, style: theme.textTheme.labelSmall),
                ],
              ),
              const SizedBox(height: 14),
              Text(value, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 2),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
