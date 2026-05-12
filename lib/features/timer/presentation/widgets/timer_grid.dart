import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/timer_bloc.dart';
import '../bloc/timer_event.dart';
import '../pages/active_timer_page.dart';

class TimerGrid extends StatelessWidget {
  const TimerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final timerValues = [5, 10, 15, 20, 25, 30, 45, -1];

    return GridView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.05,
      ),
      itemCount: timerValues.length,
      itemBuilder: (context, index) {
        final val = timerValues[index];
        return _TimerCard(value: val);
      },
    );
  }
}

class _TimerCard extends StatelessWidget {
  final int value;

  const _TimerCard({required this.value});

  @override
  Widget build(BuildContext context) {
    final isPlus = value == -1;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            if (!isPlus) {
              context.read<TimerBloc>().add(TimerStarted(durationSeconds: value * 60));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActiveTimerPage(initialMinutes: value),
                ),
              );
            }
          },
          child: Center(
            child: isPlus
                ? const Icon(
                    LucideIcons.plus,
                    size: 32,
                    color: Color(0xFF111111),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value.toString(),
                        style: AppTypography.headingLarge.copyWith(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111111),
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'min',
                        style: AppTypography.bodySmall.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF888888),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
