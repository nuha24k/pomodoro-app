import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120, top: 8),
      children: [
        _buildTaskRow(
          icon: LucideIcons.search,
          title: 'Research',
          hasToggle: true,
        ),
        _buildTaskRow(
          icon: LucideIcons.penTool,
          title: 'Publish post',
          hasToggle: true,
        ),
        // ── Row "Training" ──────────────────────────────
        _buildHighlightedTaskRow(
          icon: LucideIcons.calendar,
          title: 'Training',
          time: '7:00 pm',
        ),
        _buildTaskRow(
          icon: LucideIcons.printer,
          title: 'Print documents',
          hasToggle: true,
        ),
        _buildTaskRow(
          icon: LucideIcons.layoutGrid,
          title: 'Update design system',
          isCompleted: true,
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // TASK ROW — normal
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildTaskRow({
    required IconData icon,
    required String title,
    bool hasToggle = false,
    bool isCompleted = false,
  }) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.8),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodyMedium.copyWith(
                color: isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: AppColors.textSecondary,
              ),
            ),
          ),
          if (isCompleted)
            const Icon(
              Icons.check_circle,
              size: 22,
              color: AppColors.textPrimary,
            )
          else if (hasToggle)
            _buildToggle(isOn: false),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // TASK ROW — highlighted (lavender, event)
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildHighlightedTaskRow({
    required IconData icon,
    required String title,
    required String time,
  }) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFC5C0EE),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textPrimary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            time,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // TOGGLE PILL  —  helper
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildToggle({required bool isOn}) {
    return Container(
      width: 36,
      height: 22,
      decoration: BoxDecoration(
        color: isOn ? const Color(0xFFB8B3E9) : Colors.grey[300],
        borderRadius: BorderRadius.circular(11),
      ),
      padding: const EdgeInsets.all(3),
      alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: 16,
        height: 16,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
