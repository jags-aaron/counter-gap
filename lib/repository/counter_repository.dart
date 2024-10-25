import '../data/memory_source.dart';

abstract class CounterRepository {
  Future<int> incrementCounter();
  Future<int> decrementCounter();
}

class CounterRepositoryImpl implements CounterRepository {
  final MemorySource memorySource;

  CounterRepositoryImpl({
    required this.memorySource,
  });

  @override
  Future<int> decrementCounter() async {
    return await memorySource.decrementCounter();
  }

  @override
  Future<int> incrementCounter() async {
    return await memorySource.incrementCounter();
  }

}
