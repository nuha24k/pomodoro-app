import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  final int durationSeconds;
  const TimerStarted({required this.durationSeconds});

  @override
  List<Object> get props => [durationSeconds];
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int durationSeconds;
  const TimerTicked({required this.durationSeconds});
  
  @override
  List<Object> get props => [durationSeconds];
}
