part of 'timer_bloc.dart';

/// The following are possible [TimerEvents] in this app
///
/// 1. [TimerStarted] for when the timer is just starting
///
/// 2. [TimerPaused] to pause the timer
///
/// 3. [TimerResumed] to resume the timer if paused
///
/// 4. [TimerReset] to reset the timer to the beginning
///
/// 5. [TimerTicked] for every time the event is ticked

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/// 1. [TimerStarted] for when the timer is just starting
class TimerStarted extends TimerEvent {
  final int duration;

  TimerStarted({@required this.duration});
}

/// 2. [TimerPaused] to pause the timer
class TimerPaused extends TimerEvent {}

/// 3. [TimerResumed] to resume the timer if paused
class TimerResumed extends TimerEvent {}

/// 4. [TimerReset] to reset the timer to the beginning
class TimerReset extends TimerEvent {}

/// 5. [TimerTicked] for every time the event is ticked
class TimerTicked extends TimerEvent {
  final int duration;

  TimerTicked({@required this.duration});
}
