import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presenter/bloc/counter_events.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_state.dart';
import 'counter_model.dart';
import 'counter_screen.dart';

class CounterController extends StatelessWidget {
  const CounterController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: context.read<CounterBloc>(),
      builder: (context, state) {
        return CounterScreen(
          model: CounterModel.build(
            title: 'Nice title',
            countNumber: '${state.counter}',
            onDecrease: () {
              context.read<CounterBloc>().add(DecreaseCounterEvent());
            },
            onIncrease: () {
              context.read<CounterBloc>().add(IncreaseCounterEvent());
            },
          ),
        );
      },
    );
  }
}
