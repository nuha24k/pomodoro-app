import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/event_banner.dart';
import '../widgets/home_header.dart';
import '../widgets/task_grid.dart';

/// Halaman utama FocusFlow
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomeDataEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false, // Padding bawah disesuaikan dengan spacer bottom nav
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const HomeHeader(),
                    const SizedBox(height: 32),
                    const EventBanner(),
                    const SizedBox(height: 32),
                    _buildTaskGridSection(),
                    // Spacer untuk bottom nav agar tidak tertutup
                    const SizedBox(height: 120),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Membuat bagian Task Grid dengan mendengarkan state dari BLoC
  Widget _buildTaskGridSection() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return TaskGrid(tasks: state.tasks);
      },
    );
  }
}
