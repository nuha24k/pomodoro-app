import 'package:equatable/equatable.dart';

/// Abstract class untuk semua event di Home Screen
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

/// Event untuk mengubah status toggle sebuah task (selesai / belum selesai)
class ToggleTaskEvent extends HomeEvent {
  final String taskId;

  const ToggleTaskEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

/// Event untuk inisialisasi awal data (dummy data untuk saat ini)
class LoadHomeDataEvent extends HomeEvent {}
