import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.countNumber,
    required this.onDecrease,
    required this.onIncrease,
  });

  final String countNumber;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          countNumber,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: onDecrease,
              child: const Text('Decrement'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onIncrease,
              child: const Text('Increment'),
            )
          ],
        )
      ],
    );
  }
}
