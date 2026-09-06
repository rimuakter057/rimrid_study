import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Manrope-based type scale with a clear visual hierarchy.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color color = AppColors.textPrimary,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.manrope(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Display / large headings
  static TextStyle h1 = _base(size: 30, weight: FontWeight.w800, height: 1.2);
  static TextStyle h2 = _base(size: 24, weight: FontWeight.w800, height: 1.25);
  static TextStyle h3 = _base(size: 20, weight: FontWeight.w700, height: 1.3);

  // Section titles
  static TextStyle sectionTitle =
      _base(size: 17, weight: FontWeight.w700, height: 1.3);
  static TextStyle cardTitle =
      _base(size: 15, weight: FontWeight.w700, height: 1.35);

  // Body
  static TextStyle bodyLarge =
      _base(size: 15, weight: FontWeight.w500, height: 1.45);
  static TextStyle bodyMedium =
      _base(size: 14, weight: FontWeight.w500, height: 1.45);
  static TextStyle bodyRegular = _base(
      size: 14,
      weight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.45);

  // Labels / captions
  static TextStyle label =
      _base(size: 13, weight: FontWeight.w600, color: AppColors.textSecondary);
  static TextStyle caption = _base(
      size: 12, weight: FontWeight.w500, color: AppColors.textMuted);
  static TextStyle overline = _base(
    size: 11,
    weight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 0.6,
  );

  // Buttons
  static TextStyle button =
      _base(size: 15, weight: FontWeight.w700, color: AppColors.textOnPrimary);
  static TextStyle buttonOutlined =
      _base(size: 15, weight: FontWeight.w700, color: AppColors.primary);
}
