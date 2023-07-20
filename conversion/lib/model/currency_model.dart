enum CurrencyType { dolar, euro, real }

class CurrencyModel {
  final CurrencyType currencyType;

  CurrencyModel({
    this.currencyType = CurrencyType.real,
  });

  double convertAmount(double newAmount) {
    switch (currencyType) {
      case CurrencyType.real:
        return newAmount;

      case CurrencyType.dolar:
        return newAmount * 4.90;

      default:
        return newAmount * 5.23;
    }
  }
}
