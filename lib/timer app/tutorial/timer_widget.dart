import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/timer%20app/tutorial/background_widget.dart';

import 'actions_widget.dart';
import 'bloc/timer_bloc.dart';

class Timer extends StatelessWidget {
  static const timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Timer'),
      ),
      body: Stack(
        children: [
          BackgroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final minutestr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final secondstr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');

                      return Text(
                        '$minutestr : $secondstr',
                        style: timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                buildWhen: (previousState, currentState) =>
                    currentState.runtimeType != previousState.runtimeType,
                builder: (context, state) => ActionsWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
