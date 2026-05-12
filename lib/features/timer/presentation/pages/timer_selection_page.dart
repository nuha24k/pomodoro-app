import 'package:flutter/material.dart';
import '../../../../core/widgets/shared_bottom_nav.dart';
import '../../../../core/navigation/navigation_cubit.dart';

import '../widgets/timer_header.dart';
import '../widgets/timer_grid.dart';

class TimerSelectionPage extends StatelessWidget {
  const TimerSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Stack(
        children: [
          const SafeArea(
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
          // BOTTOM NAV
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SharedBottomNav(activeTab: NavigationTab.timer),
          ),
        ],
      ),
    );
  }
}
