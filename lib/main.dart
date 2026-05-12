import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_colors.dart';
import 'core/navigation/navigation_cubit.dart';
import 'core/navigation/main_page.dart';
import 'features/timer/presentation/bloc/timer_bloc.dart';

void main() {
  runApp(const PodomoroApp());
}

class PodomoroApp extends StatelessWidget {
  const PodomoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => TimerBloc()),
      ],
      child: MaterialApp(
        title: 'FocusFlow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryAccent,
            surface: AppColors.background,
          ),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}

