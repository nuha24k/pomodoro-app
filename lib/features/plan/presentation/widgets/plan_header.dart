import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_colors.dart';

/// Header Halaman Plan yang menampilkan waktu (static/mock)
/// dan informasi Hari serta Tanggal secara dinamis berbasis tanggal terpilih.
class PlanHeader extends StatelessWidget {
  final DateTime selectedDate;

  const PlanHeader({
    super.key,
    required this.selectedDate,
  });

  /// Mendapatkan nama bulan singkat dalam bahasa Inggris
  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  /// Mendapatkan nama hari lengkap dalam bahasa Inggris
  String _getWeekdayName(int weekday) {
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return weekdays[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Tampilan Jam Mockup
          Text(
            '11:50',
            style: AppTypography.timerDisplay.copyWith(
              fontSize: 56,
              fontWeight: FontWeight.w300,
              color: AppColors.textPrimary,
              height: 1.0,
            ),
          ),
          
          // Bagian Teks Hari & Tanggal Dinamis
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${_getMonthName(selectedDate.month)}, ${selectedDate.day}',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  _getWeekdayName(selectedDate.weekday),
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
