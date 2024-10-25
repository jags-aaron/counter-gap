import 'package:equatable/equatable.dart';

enum BlocHomeState {
  initial,
  loading,
  error,
  counterChanged,
}

class CounterState extends Equatable {
  const CounterState({
    this.status = BlocHomeState.initial,
    this.counter = 0,
  });

  final BlocHomeState? status;
  final int? counter;

  @override
  List<Object?> get props => [
    status,
    counter,
  ];

  CounterState copyWith({
    required BlocHomeState status,
    int? counter,
  }) {
    return CounterState(
      status: status,
      counter: counter ?? this.counter,
    );
  }
}