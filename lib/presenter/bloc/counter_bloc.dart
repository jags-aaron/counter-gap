import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/counter_repository.dart';
import 'counter_events.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository repository;

  CounterBloc({
    required this.repository,
  }) : super(const CounterState()) {
    on<IncreaseCounterEvent>((event, emit) => _incrementEvent(event, emit));
    on<DecreaseCounterEvent>((event, emit) => _decreaseEvent(event, emit));
  }

  void _incrementEvent(IncreaseCounterEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(status: BlocHomeState.loading));

    final counter = await repository.incrementCounter();

    emit(state.copyWith(status: BlocHomeState.counterChanged, counter: counter));
  }

  void _decreaseEvent(DecreaseCounterEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(status: BlocHomeState.loading));

    final counter = await repository.decrementCounter();

    emit(state.copyWith(status: BlocHomeState.counterChanged, counter: counter));
  }
}
