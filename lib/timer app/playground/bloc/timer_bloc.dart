import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int> _tickerSubscription;

  TimerBloc({Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration));

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerStarted)
      yield* _mapTimerStartedToState(event);
    else if (event is TimerPaused)
      yield* _mapTimerPausedToState(event);
    else if (event is TimerResumed)
      yield* _mapTimerResumeToState();
    else if (event is TimerReset)
      yield* _mapTimerResetToState();
    else if (event is TimerTicked) yield* _mapTimerTickedToState(event);
  }

  Stream<TimerState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInProgress(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(start.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<TimerState> _mapTimerPausedToState(TimerPaused pause) async* {
    if (state is TimerRunInProgress) _tickerSubscription?.pause();
    yield TimerRunPaused(state.duration);
  }

  Stream<TimerState> _mapTimerResumeToState() async* {
    if (state is TimerRunPaused) _tickerSubscription?.resume();
    yield TimerRunInProgress(state.duration);
  }

  Stream<TimerState> _mapTimerResetToState() async* {
    _tickerSubscription?.cancel();
    yield TimerInitial(_duration);
  }

  Stream<TimerState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0
        ? TimerRunInProgress(state.duration)
        : TimerRunCompleted();
  }
}
