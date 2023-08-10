import 'package:flutter_test/flutter_test.dart';
import 'package:modular/app/modules/week/week_store.dart';
 
void main() {
  late WeekStore store;

  setUpAll(() {
    store = WeekStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}