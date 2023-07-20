import 'package:conversion/model/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check if is the right instance', () {
    final currencyModel = CurrencyModel();

    expect(currencyModel, isInstanceOf<CurrencyModel>());
  });

  test('Should return a double type', () {
    final currencyModel = CurrencyModel();

    final result = currencyModel.convertAmount(20);

    expect(result, isA<double>());
    expect(result, isNotNull);
  });

  group('Currency test', () {
    test('Return the right conversion for Real', () {
      final currencyModel = CurrencyModel();

      final result = currencyModel.convertAmount(20);

      expect(result, 20.0);
    });

    test('Return the right conversion for Dolar', () {
      const value = 20.0;

      final currencyModel = CurrencyModel(
        currencyType: CurrencyType.dolar,
      );

      final result = currencyModel.convertAmount(value);

      expect(result, value * 4.90);
    });

    test('Return the right conversion for Euro', () {
      const value = 20.0;

      final currencyModel = CurrencyModel(
        currencyType: CurrencyType.euro,
      );

      final result = currencyModel.convertAmount(value);

      expect(result, value * 5.23);
    });
  });
}
