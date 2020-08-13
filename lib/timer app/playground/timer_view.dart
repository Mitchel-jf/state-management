import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../tutorial/background_widget.dart';
import 'actions_widget.dart';
import 'bloc/timer_bloc.dart';

class TimerView extends StatelessWidget {
  static const timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0),
                  child: BlocBuilder<TimerBloc, TimerState>(
                      builder: (context, state) {
                    final String minuteStr = ((state.duration / 60) % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    final String secondStr = (state.duration % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    return Text(
                      '$minuteStr : $secondStr',
                      style: timerTextStyle,
                    );
                  }),
                ),
                BlocBuilder<TimerBloc, TimerState>(
                  buildWhen: (previousState, currentState) =>
                      currentState.runtimeType != previousState.runtimeType,
                  builder: (context, state) => ActionsWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
