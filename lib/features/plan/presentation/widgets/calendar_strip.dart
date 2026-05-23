import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget Kalender Strip Mingguan yang dapat digeser tanpa batas (scrollable),
/// dapat diklik untuk memilih tanggal, dan secara otomatis memperbarui nama bulan
/// di atasnya secara dinamis saat digeser atau dipilih.
class CalendarStrip extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarStrip({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  late final PageController _pageController;
  late final DateTime _currentWeekStart;
  late DateTime _visibleDate;
  
  // Indeks halaman awal di tengah untuk mendukung geser ke masa lalu (kiri) dan masa depan (kanan)
  static const int _initialPage = 10000;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentWeekStart = _getStartOfWeek(now);
    _visibleDate = now;
    
    // Menginisialisasi controller pada indeks tengah
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Menghitung hari Senin untuk minggu dari tanggal yang diberikan
  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  /// Mendapatkan tanggal mulai minggu berdasarkan indeks PageView
  DateTime _getWeekStartForIndex(int index) {
    final weekOffset = index - _initialPage;
    return _currentWeekStart.add(Duration(days: weekOffset * 7));
  }

  /// Mendapatkan nama bulan dalam bahasa Inggris untuk tampilan UI
  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── INDIKATOR BULAN & TAHUN + TOMBOL TODAY ─────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_getMonthName(_visibleDate.month)} ${_visibleDate.year}',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
              // Tombol Today untuk kembali ke hari ini dengan animasi halus
              TextButton(
                onPressed: () {
                  final now = DateTime.now();
                  widget.onDateSelected(now);
                  
                  // Menghitung indeks halaman target untuk minggu hari ini
                  final targetWeekStart = _getStartOfWeek(now);
                  final differenceInDays = targetWeekStart.difference(_currentWeekStart).inDays;
                  final targetIndex = _initialPage + (differenceInDays / 7).round();
                  
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      targetIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Today',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // ── PAGEVIEW MINGGUAN HORIZONTAL ──────────────────────────────────
        SizedBox(
          height: 72,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              final weekStart = _getWeekStartForIndex(index);
              setState(() {
                // Menggunakan hari Kamis (tengah minggu) untuk estimasi nama bulan yang lebih intuitif
                _visibleDate = weekStart.add(const Duration(days: 3));
              });
            },
            itemBuilder: (context, pageIndex) {
              final weekStart = _getWeekStartForIndex(pageIndex);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (dayIndex) {
                    final date = weekStart.add(Duration(days: dayIndex));
                    final isSelected = DateUtils.isSameDay(date, widget.selectedDate);
                    final isToday = DateUtils.isSameDay(date, DateTime.now());
                    final weekdayLabel = _getWeekdayLabel(dayIndex);
                    
                    return GestureDetector(
                      onTap: () => widget.onDateSelected(date),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        width: 44,
                        height: 64,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : isToday
                                  ? Colors.white.withValues(alpha: 0.35)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: isToday && !isSelected
                              ? Border.all(color: AppColors.textPrimary.withValues(alpha: 0.2), width: 1.2)
                              : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.04),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date.day.toString(),
                              style: AppTypography.bodyLarge.copyWith(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: AppColors.textPrimary,
                                fontSize: isSelected ? 18 : 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              weekdayLabel,
                              style: AppTypography.bodySmall.copyWith(
                                color: isSelected
                                    ? AppColors.textPrimary
                                    : AppColors.textSecondary,
                                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Mengubah indeks hari menjadi label inisial nama hari
  String _getWeekdayLabel(int dayIndex) {
    const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
    return days[dayIndex];
  }
}
