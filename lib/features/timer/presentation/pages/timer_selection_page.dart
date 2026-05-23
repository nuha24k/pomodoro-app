import 'package:flutter/material.dart';
import '../widgets/timer_header.dart';
import '../widgets/timer_grid.dart';

class TimerSelectionPage extends StatelessWidget {
  const TimerSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimerHeader(),
            SizedBox(height: 16),
            Expanded(
              child: TimerGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
