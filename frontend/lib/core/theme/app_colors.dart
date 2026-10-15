import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF0F2A4D);
  static const Color primaryHover = Color(0xFF163A68);
  static const Color secondary = Color(0xFF64748B);

  static const Color success = Color(0xFF15803D);
  static const Color warning = Color(0xFFB45309);
  static const Color error = Color(0xFFB91C1C);

  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1F4F8);
  static const Color border = Color(0xFFE2E7EF);
  static const Color borderStrong = Color(0xFFCBD3DF);

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static Color primaryTint(double opacity) => primary.withValues(alpha: opacity);
}
