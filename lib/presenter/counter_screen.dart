import 'package:flutter/material.dart';
import 'package:untitled/presenter/widgets/counter_appbar.dart';
import 'package:untitled/presenter/widgets/counter_widget.dart';

import 'counter_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
    required this.model,
  });

  final CounterModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CounterAppbar(title: model.title),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.1,
          ),
          child: CounterWidget(
            countNumber: model.countNumber,
            onIncrease: model.onIncrease,
            onDecrease: model.onDecrease,
          ),
        ),
      ),
    );
  }
}
