
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/data/memory_source.dart';
import 'package:untitled/repository/counter_repository.dart';

class MockMemorySource extends Mock implements MemorySource {}

void main() {
  late CounterRepositoryImpl repository;
  late MockMemorySource memorySource;

  setUp(
    () {
      memorySource = MockMemorySource();
      repository = CounterRepositoryImpl(
        memorySource: memorySource,
      );
    },
  );

  group(
    'Increment counter',
    () {
      test('counter incremented when succeeds', () async {
        when(() => memorySource.incrementCounter()).thenAnswer((_) async => 1);

        final actual = await repository.incrementCounter();

        verify(() => memorySource.incrementCounter());
        expect(actual, 1);
      });

      test(
        'returns error when Exception',
        () async {
          when(() => memorySource.incrementCounter()).thenThrow(Exception());

          final actual = repository.incrementCounter();
          expect(actual, throwsA(isInstanceOf<Exception>()));
        },
      );
    },
  );

  group(
    'Decrement counter',
    () {
      test('counter decremented when succeeds', () async {
        when(() => memorySource.decrementCounter()).thenAnswer((_) async => 1);

        final actual = await repository.decrementCounter();

        verify(() => memorySource.decrementCounter());
        expect(actual, 1);
      });

      test(
        'returns error when Exception',
        () async {
          when(() => memorySource.decrementCounter()).thenThrow(Exception());

          final actual = repository.decrementCounter();
          expect(actual, throwsA(isInstanceOf<Exception>()));
        },
      );
    },
  );
}
