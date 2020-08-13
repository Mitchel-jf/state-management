import 'dart:async';

/// [Ticker] exposes a single method that creates a
/// stream<int> that returns an int (i.e seconds) every second.
class Ticker {
  Stream<int> tick(int ticks) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
