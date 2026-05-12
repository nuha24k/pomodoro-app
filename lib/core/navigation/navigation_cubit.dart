import 'package:flutter_bloc/flutter_bloc.dart';

/// Tab yang tersedia di Bottom Navigation
enum NavigationTab { home, plan, timer }

/// Cubit untuk mengelola state navigasi (Bottom Navigation)
class NavigationCubit extends Cubit<NavigationTab> {
  NavigationCubit() : super(NavigationTab.home);

  /// Pindah ke tab baru
  void setTab(NavigationTab tab) => emit(tab);
}
