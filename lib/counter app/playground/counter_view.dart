import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.headline2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter App with Bloc'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) => Text('$state', style: style),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTapDown: (details) => context.bloc<CounterCubit>().increment(),
            child: CircleAvatar(
              child: Icon(Icons.add),
              // onPressed: () => context.bloc<CounterCubit>().increment(),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => context.bloc<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
