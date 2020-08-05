part of 'timer_bloc.dart';

/// ### Our [TimerBloc] state can be one of the following:
///
/// [TimerInitial] — ready to start counting down from the specified duration.
///
/// [TimerRunInProgress] — actively counting down from the specified duration.
///
/// [TimerRunPause] — paused at some remaining duration.
///
/// [TimerRunComplete] — completed with a remaining duration of 0.
///
/// ### Each of these states will have an implication on what the user sees. For example:
///
/// if the state is [TimerInitial] the user will be able to start the timer.
///
/// if the state is [TimerRunInProgress] the user will be able to pause
/// and reset the timer as well as see the remaining duration.
///
/// if the state is [TimerRunPause] the user will
/// be able to resume the timer and reset the timer.
///
/// if the state is [TimerRunComplete] the user will be able to reset the timer.

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

/// [TimerInitial] — ready to start counting down from the specified duration.
///
/// if the state is [TimerInitial] the user will be able to start the timer.
class TimerInitial extends TimerState {
  TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

/// [TimerRunPause] — paused at some remaining duration.
///
/// if the state is [TimerRunPause] the user will
/// be able to resume the timer and reset the timer.
class TimerRunPause extends TimerState {
  TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

/// [TimerRunInProgress] — actively counting down from the specified duration.
///
/// if the state is [TimerRunInProgress] the user will be able to pause
/// and reset the timer as well as see the remaining duration.
class TimerRunInProgress extends TimerState {
  TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

/// [TimerRunComplete] — completed with a remaining duration of 0.
///
/// if the state is [TimerRunComplete] the user will be able to reset the timer.
class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(0);

  @override
  String toString() => 'TimerRunComplete { duration: $duration }';
}
