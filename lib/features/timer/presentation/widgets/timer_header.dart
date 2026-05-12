import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';

class TimerHeader extends StatelessWidget {
  const TimerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
      child: Text(
        'TRACK YOUR\nFOCUS TIME',
        style: AppTypography.headingLarge.copyWith(
          fontSize: 28,
          color: const Color(0xFF111111),
          height: 1.1,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
