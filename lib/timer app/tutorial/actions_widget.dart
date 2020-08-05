import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/timer_bloc.dart';

class ActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    final resetTimer = FloatingActionButton(
      child: Icon(Icons.replay),
      onPressed: () => timerBloc.add(TimerReset()),
    );
    if (currentState is TimerInitial)
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(
            TimerStarted(duration: currentState.duration),
          ),
        )
      ];
    else if (currentState is TimerRunInProgress)
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(TimerPaused()),
        ),
        resetTimer,
      ];
    else if (currentState is TimerRunPause)
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(TimerResumed()),
        ),
        resetTimer,
      ];
    else if (currentState is TimerRunComplete)
      return [resetTimer];
    else
      return [];
  }
}
