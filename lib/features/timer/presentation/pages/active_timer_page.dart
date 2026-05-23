import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/shared_bottom_nav.dart';
import '../../../../core/navigation/navigation_cubit.dart';
import '../bloc/timer_bloc.dart';
import '../bloc/timer_event.dart';
import '../bloc/timer_state.dart';

class ActiveTimerPage extends StatelessWidget {
  final int initialMinutes;

  const ActiveTimerPage({super.key, required this.initialMinutes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          final timeText = state.timeString;
          final progress = state.progress;
          final isPaused = state.status == TimerStatus.paused;

          return Stack(
            children: [
              SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24, top: 20, right: 24),
                      child: Text(
                        'TRACK YOUR\nFOCUS TIME',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF111111),
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Timer Circle
                            Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withAlpha(200),
                                    blurRadius: 24,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Circular Progress
                                  SizedBox(
                                    width: 260,
                                    height: 260,
                                    child: CircularProgressIndicator(
                                      value: progress,
                                      strokeWidth: 8,
                                      backgroundColor: const Color(0xFFE0DEFF),
                                      color: const Color(0xFFB8B3E9),
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                  // Text Content
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        timeText,
                                        style: const TextStyle(
                                          fontSize: 56,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF111111),
                                          letterSpacing: -1,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'just focus',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF888888),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 48), // Gap below circle
                            
                            // Controls
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Stop Button
                                _ControlButton(
                                  icon: Icons.square, // filled square
                                  onTap: () {
                                    context.read<TimerBloc>().add(TimerReset());
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(width: 48), // Gap between buttons
                                // Pause/Resume Button
                                _ControlButton(
                                  icon: isPaused ? Icons.play_arrow : Icons.pause, 
                                  onTap: () {
                                    if (isPaused) {
                                      context.read<TimerBloc>().add(TimerResumed());
                                    } else {
                                      context.read<TimerBloc>().add(TimerPaused());
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // BOTTOM NAV
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SharedBottomNav(
                  activeTab: NavigationTab.timer,
                  timerLabel: timeText,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
