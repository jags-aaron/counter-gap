import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/data/memory_source.dart';

void main() {
  group('MemorySourceImpl', () {
    late MemorySourceImpl memorySource;

    setUp(() {
      memorySource = MemorySourceImpl();
    });

    test('incrementCounter should increase countNumber by 1', () async {
      final result = await memorySource.incrementCounter();
      expect(result, 1);
    });

    test('decrementCounter should decrease countNumber by 1', () async {
      await memorySource.incrementCounter(); // to make countNumber 1
      final result = await memorySource.decrementCounter();
      expect(result, 0);
    });

    test('incrementCounter should handle multiple increments', () async {
      await memorySource.incrementCounter();
      await memorySource.incrementCounter();
      final result = await memorySource.incrementCounter();
      expect(result, 3);
    });

    test('decrementCounter should handle multiple decrements', () async {
      await memorySource.incrementCounter();
      await memorySource.incrementCounter();
      await memorySource.incrementCounter();
      await memorySource.decrementCounter();
      await memorySource.decrementCounter();
      final result = await memorySource.decrementCounter();
      expect(result, 0);
    });

    test('decrementCounter should not go below zero', () async {
      final result = await memorySource.decrementCounter();
      expect(result, -1);
    });
  });
}