import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    this.tone = StatusTone.neutral,
    this.icon,
  });

  final String label;
  final StatusTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = switch (tone) {
      StatusTone.success => (
          foreground: AppColors.success,
          background: AppColors.success.withValues(alpha: 0.10),
        ),
      StatusTone.warning => (
          foreground: AppColors.warning,
          background: AppColors.warning.withValues(alpha: 0.10),
        ),
      StatusTone.error => (
          foreground: AppColors.error,
          background: AppColors.error.withValues(alpha: 0.10),
        ),
      StatusTone.neutral => (
          foreground: AppColors.textSecondary,
          background: AppColors.surfaceMuted,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: colors.foreground),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: colors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

enum StatusTone { success, warning, error, neutral }
