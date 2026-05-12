import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation_cubit.dart';
import '../../../../core/widgets/shared_bottom_nav.dart';

import '../widgets/plan_header.dart';
import '../widgets/calendar_strip.dart';
import '../widgets/task_list.dart';

/// Halaman Plan/Schedule untuk melihat daftar tugas dan kalender
class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // ── KONTEN UTAMA ──────────────────────────────────────────────
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanHeader(),
                SizedBox(height: 16),
                CalendarStrip(),
                SizedBox(height: 16),
                Expanded(child: TaskList()),
              ],
            ),

            // ── BOTTOM NAV (selalu paling atas) ───────────────────────────
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SharedBottomNav(activeTab: NavigationTab.plan),
            ),
          ],
        ),
      ),
    );
  }
}