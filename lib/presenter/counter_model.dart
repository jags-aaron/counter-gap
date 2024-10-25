import 'dart:ui';

import 'package:equatable/equatable.dart';

class CounterModel extends Equatable {
  final String title;
  final String countNumber;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CounterModel._({
    required this.title,
    required this.countNumber,
    required this.onIncrease,
    required this.onDecrease,
  });

  factory CounterModel.build({
    required String title,
    required String countNumber,
    required VoidCallback onIncrease,
    required VoidCallback onDecrease,
  }) {
    return CounterModel._(
      title: title,
      countNumber: countNumber,
      onIncrease: onIncrease,
      onDecrease: onDecrease,
    );
  }

  @override
  List<Object?> get props => [
        title,
        countNumber,
        onIncrease,
        onDecrease,
      ];
}
