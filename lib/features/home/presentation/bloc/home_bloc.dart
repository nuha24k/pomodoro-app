import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../domain/entities/task_entity.dart';
import 'home_event.dart';
import 'home_state.dart';

/// BLoC untuk mengelola logika bisnis di layar Home
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<ToggleTaskEvent>(_onToggleTask);
  }

  /// Memuat data awal (Dummy data untuk Task Grid 2x2)
  void _onLoadHomeData(LoadHomeDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(isLoading: true));

    // Data dummy sesuai dengan desain
    final initialTasks = [
      const TaskEntity(
        id: '1',
        name: 'English hometask',
        icon: LucideIcons.book, // Ikon buku
        isCompleted: false,
      ),
      const TaskEntity(
        id: '2',
        name: 'Finish design for the project',
        icon: LucideIcons.checkSquare, // Ikon checkbox
        isCompleted: true, // Asumsikan aktif sebagai contoh, atau nonaktif
      ),
      const TaskEntity(
        id: '3',
        name: 'Research',
        icon: LucideIcons.search, // Ikon search
        isCompleted: false,
      ),
      const TaskEntity(
        id: '4',
        name: 'Publish post',
        icon: LucideIcons.penTool, // Ikon edit / pen
        isCompleted: false,
      ),
    ];

    emit(state.copyWith(
      tasks: initialTasks,
      isLoading: false,
    ));
  }

  /// Menangani aksi toggle pada task card
  void _onToggleTask(ToggleTaskEvent event, Emitter<HomeState> emit) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == event.taskId) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();

    emit(state.copyWith(tasks: updatedTasks));
  }
}
