import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/timer%20app/tutorial/bloc/timer_bloc.dart';
import 'package:state_management/timer%20app/tutorial/ticker.dart';

import 'timer_widget.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      title: 'Flutter Timer',
      home: BlocProvider(
        create: (_) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      ),
    );
  }
}
