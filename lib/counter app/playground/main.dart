import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'counter_observer.dart';
import 'counter_page.dart';

main() {
  Bloc.observer = CounterObserver();
  runApp(CounterApp());
}

class CounterApp extends MaterialApp {
  const CounterApp({Key key})
      : super(
          key: key,
          home: const CounterPage(),
        );
}
