abstract class MemorySource {
  Future<int> incrementCounter();

  Future<int> decrementCounter();
}

class MemorySourceImpl implements MemorySource {
  int countNumber = 0;

  @override
  Future<int> decrementCounter() async {
    return --countNumber;
  }

  @override
  Future<int> incrementCounter() async {
    return ++countNumber;
  }
}
