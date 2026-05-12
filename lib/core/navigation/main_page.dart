import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/plan/presentation/pages/plan_page.dart';
import '../../features/timer/presentation/pages/timer_selection_page.dart';

/// Halaman utama yang mengatur perpindahan tab menggunakan BLoC
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationTab>(
      builder: (context, state) {
        switch (state) {
          case NavigationTab.home:
            return const HomePage();
          case NavigationTab.plan:
            return const PlanPage();
          case NavigationTab.timer:
            return const TimerSelectionPage();
        }
      },
    );
  }
}
