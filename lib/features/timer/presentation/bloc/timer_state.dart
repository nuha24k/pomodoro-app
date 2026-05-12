import 'package:equatable/equatable.dart';

enum TimerStatus { initial, running, paused, completed }

class TimerState extends Equatable {
  final TimerStatus status;
  final int initialDuration;
  final int remainingDuration;

  const TimerState({
    required this.status,
    required this.initialDuration,
    required this.remainingDuration,
  });

  factory TimerState.initial() {
    return const TimerState(
      status: TimerStatus.initial,
      initialDuration: 0,
      remainingDuration: 0,
    );
  }

  TimerState copyWith({
    TimerStatus? status,
    int? initialDuration,
    int? remainingDuration,
  }) {
    return TimerState(
      status: status ?? this.status,
      initialDuration: initialDuration ?? this.initialDuration,
      remainingDuration: remainingDuration ?? this.remainingDuration,
    );
  }

  double get progress =>
      initialDuration > 0 ? 1.0 - (remainingDuration / initialDuration) : 0.0;

  String get timeString {
    if (initialDuration == 0 && remainingDuration == 0) return 'Timer';
    final minutesStr = (remainingDuration / 60).floor().toString().padLeft(2, '0');
    final secondsStr = (remainingDuration % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  List<Object> get props => [status, initialDuration, remainingDuration];
}
