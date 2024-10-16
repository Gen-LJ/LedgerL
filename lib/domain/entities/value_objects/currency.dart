enum Currency {
  USD,
  SGD,
  EUR,
  GBP,
  JPY,
  AUD,
}

extension CurrencyExtension on Currency {
  String get code {
    switch (this) {
      case Currency.USD:
        return 'USD';
      case Currency.SGD:
        return 'SGD';
      case Currency.EUR:
        return 'EUR';
      case Currency.GBP:
        return 'GBP';
      case Currency.JPY:
        return 'JPY';
      case Currency.AUD:
        return 'AUD';
    }
  }

  // Method to get enum from string
  static Currency fromString(String code) {
    switch (code.toUpperCase()) {
      case 'USD':
        return Currency.USD;
      case 'SGD':
        return Currency.SGD;
      case 'EUR':
        return Currency.EUR;
      case 'GBP':
        return Currency.GBP;
      case 'JPY':
        return Currency.JPY;
      case 'AUD':
        return Currency.AUD;
      default:
        throw ArgumentError('Invalid currency code: $code');
    }
  }
}

