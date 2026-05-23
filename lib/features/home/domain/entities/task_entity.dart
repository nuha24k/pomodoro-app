import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// Entitas Tugas (Task) untuk layar Home
class TaskEntity extends Equatable {
  final String id;
  final String name;
  final IconData icon;
  final bool isCompleted;

  const TaskEntity({
    required this.id,
    required this.name,
    required this.icon,
    this.isCompleted = false,
  });

  /// Membuat salinan dari TaskEntity dengan beberapa field yang diubah
  TaskEntity copyWith({
    String? id,
    String? name,
    IconData? icon,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, name, icon, isCompleted];
}
