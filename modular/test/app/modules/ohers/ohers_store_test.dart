import 'package:flutter_test/flutter_test.dart';
import 'package:modular/app/modules/ohers/ohers_store.dart';
 
void main() {
  late OhersStore store;

  setUpAll(() {
    store = OhersStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}