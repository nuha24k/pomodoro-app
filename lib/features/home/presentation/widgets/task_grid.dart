import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/task_entity.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

/// Grid tugas 2x2 yang menampilkan daftar TaskCard
class TaskGrid extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TaskGrid({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0, // Persegi
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(task: tasks[index]);
      },
    );
  }
}

/// Card individual untuk setiap task
class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Toggle Switch & Icon Container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                task.icon,
                color: task.isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
                size: 24,
              ),
              GestureDetector(
                onTap: () {
                  context.read<HomeBloc>().add(ToggleTaskEvent(task.id));
                },
                child: _buildTogglePill(task.isCompleted),
              ),
            ],
          ),
          // Task Name
          Text(
            task.name,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: task.isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Membuat custom pill untuk toggle
  Widget _buildTogglePill(bool isActive) {
    return Container(
      width: 44,
      height: 24,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryAccent : AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: isActive ? null : Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(2),
      alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          boxShadow: isActive
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
        ),
      ),
    );
  }
}
