import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Definisi typography untuk aplikasi FocusFlow menggunakan Google Fonts (Inter)
class AppTypography {
  /// Headings: Bold, large, uppercase or sentence case, tight letter spacing
  static TextStyle get headingLarge => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w800, // Extra Bold
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle get headingMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
      );

  /// Body: Regular weight, 14–16sp
  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
      );

  /// Timer display: Extra-large (72–96sp), thin or light weight
  static TextStyle get timerDisplay => GoogleFonts.inter(
        fontSize: 84,
        fontWeight: FontWeight.w200, // Extra Light / Thin
        color: AppColors.textPrimary,
      );
}
