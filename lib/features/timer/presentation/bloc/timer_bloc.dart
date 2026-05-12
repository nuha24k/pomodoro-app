import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? _timer;

  TimerBloc() : super(TimerState.initial()) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(state.copyWith(
      status: TimerStatus.running,
      initialDuration: event.durationSeconds,
      remainingDuration: event.durationSeconds,
    ));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TimerTicked(durationSeconds: state.remainingDuration - 1));
    });
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state.status == TimerStatus.running) {
      _timer?.cancel();
      emit(state.copyWith(status: TimerStatus.paused));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state.status == TimerStatus.paused) {
      emit(state.copyWith(status: TimerStatus.running));
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(TimerTicked(durationSeconds: state.remainingDuration - 1));
      });
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _timer?.cancel();
    emit(TimerState.initial());
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    if (event.durationSeconds > 0) {
      emit(state.copyWith(remainingDuration: event.durationSeconds));
    } else {
      _timer?.cancel();
      emit(state.copyWith(
        status: TimerStatus.completed,
        remainingDuration: 0,
      ));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
