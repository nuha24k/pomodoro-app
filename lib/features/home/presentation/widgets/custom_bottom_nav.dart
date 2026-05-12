import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Custom Bottom Navigation Bar berbentuk Pill
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dark Pill Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.navBarBackground,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Active Home Item
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(LucideIcons.home, size: 20, color: AppColors.textPrimary),
                        const SizedBox(width: 8),
                        Text(
                          'Home',
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Tasks Icon
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/plan');
                    },
                    icon: const Icon(LucideIcons.checkSquare, color: AppColors.textSecondary),
                  ),
                  // Timer Icon
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.clock, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            
            // FAB Kanan
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.navBarBackground,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.plus, color: AppColors.surface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
