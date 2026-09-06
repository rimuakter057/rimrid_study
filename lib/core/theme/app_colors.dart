import 'package:flutter/material.dart';

/// Central color palette for RimRid Study.
/// Premium EdTech look: dark green primary, white surfaces, very light
/// green accents, charcoal/gray text. No pink/purple, minimal gradients.
class AppColors {
  AppColors._();

  // Primary — Dark Green
  static const Color primary = Color(0xFF0F5132);
  static const Color primaryDark = Color(0xFF0A3D24);
  static const Color primaryLight = Color(0xFF1B7A4D);

  // Secondary — Very Light Green
  static const Color secondaryLight = Color(0xFFE7F5EC);
  static const Color secondaryLighter = Color(0xFFF2FAF5);

  // Surfaces
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFFBFDFC);

  // Text
  static const Color textPrimary = Color(0xFF1A1E1B);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Borders / Dividers
  static const Color border = Color(0xFFE7EAE8);
  static const Color divider = Color(0xFFEFF2F0);

  // Status
  static const Color success = Color(0xFF1B7A4D);
  static const Color warning = Color(0xFFB7791F);
  static const Color error = Color(0xFFC0392B);
  static const Color info = Color(0xFF2563EB);

  // Ratings
  static const Color star = Color(0xFFF5A623);

  // Overlays / Shadows
  static const Color shadow = Color(0x14000000);
  static const Color overlay = Color(0x66000000);

  // Level tags
  static const Color levelBeginner = Color(0xFF1B7A4D);
  static const Color levelIntermediate = Color(0xFFB7791F);
  static const Color levelAdvanced = Color(0xFFC0392B);
}
