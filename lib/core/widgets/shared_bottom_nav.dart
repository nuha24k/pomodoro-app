import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../navigation/navigation_cubit.dart';
import '../../features/timer/presentation/bloc/timer_bloc.dart';
import '../../features/timer/presentation/bloc/timer_state.dart';

/// Custom Bottom Navigation Bar yang dibagikan antar halaman
class SharedBottomNav extends StatefulWidget {
  final NavigationTab activeTab;
  final String timerLabel;

  const SharedBottomNav({
    super.key, 
    required this.activeTab,
    this.timerLabel = 'Timer',
  });

  @override
  State<SharedBottomNav> createState() => _SharedBottomNavState();
}

class _SharedBottomNavState extends State<SharedBottomNav> {
  bool _isMenuOpen = false;

  void _onNavigate(BuildContext context, NavigationTab tab) {
    if (widget.activeTab == tab) return;
    context.read<NavigationCubit>().setTab(tab);
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        // Menu konteks melayang di atas FAB
        if (_isMenuOpen)
          Positioned(
            bottom: 130, // Jarak di atas FAB agar tidak bertabrakan dengan tombol
            right: 24,
            child: _buildFloatingContextMenu(),
          ),
        
        // Bottom Nav Bar
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dark Pill Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.navBarBackground,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Home Icon
                      _buildNavItem(
                        context: context,
                        icon: LucideIcons.home,
                        label: 'Home',
                        isActive: widget.activeTab == NavigationTab.home,
                        onTap: () => _onNavigate(context, NavigationTab.home),
                      ),
                      const SizedBox(width: 8),

                      // Tasks Icon
                      _buildNavItem(
                        context: context,
                        icon: LucideIcons.checkSquare,
                        label: 'Tasks',
                        isActive: widget.activeTab == NavigationTab.plan,
                        onTap: () => _onNavigate(context, NavigationTab.plan),
                      ),
                      const SizedBox(width: 8),

                      // Timer Icon
                      BlocBuilder<TimerBloc, TimerState>(
                        builder: (context, state) {
                          final label = (state.status == TimerStatus.running || state.status == TimerStatus.paused) 
                              ? state.timeString 
                              : widget.timerLabel;
                              
                          return _buildNavItem(
                            context: context,
                            icon: LucideIcons.clock,
                            label: label,
                            isActive: widget.activeTab == NavigationTab.timer,
                            onTap: () => _onNavigate(context, NavigationTab.timer),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // FAB Kanan
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: _isMenuOpen
                        ? AppColors.surface
                        : AppColors.navBarBackground,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _toggleMenu,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Icon(
                        _isMenuOpen ? LucideIcons.x : LucideIcons.plus,
                        key: ValueKey(_isMenuOpen),
                        color: _isMenuOpen
                            ? AppColors.textPrimary
                            : AppColors.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 16 : 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingContextMenu() {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildContextMenuItem(LucideIcons.checkCircle2, 'To Do'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(height: 1, thickness: 0.8, color: Colors.black12),
            ),
            _buildContextMenuItem(LucideIcons.calendar, 'Event'),
          ],
        ),
      ),
    );
  }

  Widget _buildContextMenuItem(IconData icon, String text) {
    return InkWell(
      onTap: () {
        _toggleMenu();
        // Tindakan spesifik lainnya
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.textPrimary),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
