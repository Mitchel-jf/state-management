part of 'timer_bloc.dart';

/// [TimerState] can have the following possible states
///
/// 1. [TimerInitial] which is the initial state of the timer
///
/// 2. [TimerRunInProgress] which is when the timer is running
///
/// 3. [TimerRunPaused] which is when the timer is paused
///
/// 5. [TimerRunCompleted] which is when the timer is at zero

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [];
}

/// [TimerInitial] which is the initial state of the timer
class TimerInitial extends TimerState {
  TimerInitial(int duration) : super(duration);
}

/// [TimerRunInProgress] which is when the timer is running
class TimerRunInProgress extends TimerState {
  TimerRunInProgress(int duration) : super(duration);
}

/// [TimerRunPaused] which is when the timer is paused
class TimerRunPaused extends TimerState {
  TimerRunPaused(int duration) : super(duration);
}



/// 5. [TimerRunCompleted] which is when the timer is at zero
class TimerRunCompleted extends TimerState {
  TimerRunCompleted() : super(0);
}
