import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_colors.dart';

class CalendarStrip extends StatelessWidget {
  const CalendarStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
    final dates = ['10', '11', '12', '13', '14', '15', '16'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (i) {
          final selected = i == 1; // 11 tue
          return Container(
            width: 44,
            height: 64,
            decoration: selected
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  )
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dates[i],
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    color: AppColors.textPrimary,
                    fontSize: selected ? 18 : 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  days[i],
                  style: AppTypography.bodySmall.copyWith(
                    color: selected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
