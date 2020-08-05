part of 'timer_bloc.dart';

/// ### Our [TimerBloc] will need to know how to process the following events:
///
/// [TimerStarted] — informs the TimerBloc that the timer should be started.
///
/// [TimerPaused] — informs the TimerBloc that the timer should be paused.
///
/// [TimerResumed] — informs the TimerBloc that the timer should be resumed.
///
/// [TimerReset] — informs the TimerBloc that the timer should be reset to the original state.
///
/// [TimerTicked] — informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/// [TimerStarted] — informs the TimerBloc that the timer should be started.
class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({@required this.duration});

  @override
  String toString() => 'TimerStarted { duration $duration }';
}

/// [TimerPaused] — informs the TimerBloc that the timer should be paused.
class TimerPaused extends TimerEvent {}

/// [TimerResumed] — informs the TimerBloc that the timer should be resumed.
class TimerResumed extends TimerEvent {}

/// [TimerReset] — informs the TimerBloc that the timer should be
/// reset to the original state.
class TimerReset extends TimerEvent {}

/// [TimerTicked] — informs the TimerBloc that a tick has occurred
/// and that it needs to update its state accordingly.
class TimerTicked extends TimerEvent {
  final int duration;

  const TimerTicked({@required this.duration});

  @override
  String toString() => 'TimerTicked { duration $duration }';

  @override
  List<Object> get props => [duration];
}
