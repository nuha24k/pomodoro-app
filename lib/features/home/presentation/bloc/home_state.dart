import 'package:equatable/equatable.dart';
import '../../domain/entities/task_entity.dart';

/// State untuk layar Home
class HomeState extends Equatable {
  final List<TaskEntity> tasks;
  final bool isLoading;

  const HomeState({
    this.tasks = const [],
    this.isLoading = false,
  });

  /// Membuat salinan HomeState dengan perubahan field tertentu
  HomeState copyWith({
    List<TaskEntity>? tasks,
    bool? isLoading,
  }) {
    return HomeState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoading];
}
