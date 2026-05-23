import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_cubit.dart';
import '../widgets/shared_bottom_nav.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/plan/presentation/pages/plan_page.dart';
import '../../features/timer/presentation/pages/timer_selection_page.dart';

/// Halaman utama yang mengatur perpindahan tab menggunakan BLoC dengan animasi transisi smooth
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationTab>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // Area konten halaman utama yang dimuat secara instan tanpa transisi layar
              _buildPage(state),

              // Bottom Navigation Bar yang diposisikan melayang (floating) di atas halaman
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SharedBottomNav(activeTab: state),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Membangun halaman yang sesuai dengan tab aktif dengan menyertakan ValueKey
  /// agar AnimatedSwitcher dapat mengenali perubahan dan memicu animasi
  Widget _buildPage(NavigationTab tab) {
    switch (tab) {
      case NavigationTab.home:
        return const HomePage(key: ValueKey('home_page'));
      case NavigationTab.plan:
        return const PlanPage(key: ValueKey('plan_page'));
      case NavigationTab.timer:
        return const TimerSelectionPage(key: ValueKey('timer_page'));
    }
  }
}
