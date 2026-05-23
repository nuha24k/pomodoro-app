import 'package:flutter/material.dart';

import '../widgets/plan_header.dart';
import '../widgets/calendar_strip.dart';
import '../widgets/task_list.dart';

/// Halaman Plan/Schedule untuk melihat daftar tugas dan kalender strip scrollable
class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  // Tanggal aktif yang dipilih oleh pengguna (default: hari ini)
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header tanggal dinamis reaktif
            PlanHeader(selectedDate: _selectedDate),
            const SizedBox(height: 16),
            
            // Strip kalender mingguan horizontal yang dapat digeser tanpa batas
            CalendarStrip(
              selectedDate: _selectedDate,
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 16),
            
            // Daftar tugas harian
            const Expanded(child: TaskList()),
          ],
        ),
      ),
    );
  }
}