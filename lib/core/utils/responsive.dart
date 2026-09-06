import 'package:flutter/material.dart';

/// Lightweight responsive helpers (no external scaling package).
/// Scales paddings/font sizes gently based on device width so layouts
/// stay comfortable on small phones and large phones/tablets alike.
class Responsive {
  Responsive._();

  static const double _baseWidth = 390; // iPhone 14-ish baseline

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double height(BuildContext context) => MediaQuery.sizeOf(context).height;

  static bool isTablet(BuildContext context) => width(context) >= 700;

  /// Scales a value proportionally to screen width, clamped to avoid
  /// extreme sizes on very small or very large screens.
  static double scale(BuildContext context, double value, {double min = 0.85, double max = 1.25}) {
    final factor = (width(context) / _baseWidth).clamp(min, max);
    return value * factor;
  }

  static EdgeInsets pagePadding(BuildContext context) {
    final horizontal = isTablet(context) ? 32.0 : 20.0;
    return EdgeInsets.symmetric(horizontal: horizontal);
  }
}
