import 'package:ledger_l/presentation/presentation.dart';

extension Currency on String {
  String get flag {
    switch (toUpperCase()) {
      case 'USD':
        return R.flags.usa;
      case 'SGD':
        return R.flags.singapore;
      case 'EUR':
        return R.flags.europeUnion;
      case 'GBP':
        return R.flags.british;
      case 'JPY':
        return R.flags.japan;
      case 'AUD':
        return R.flags.australia;
      default:
        throw ArgumentError('No flag available for currency code: $this');
    }
  }

  String get symbol {
    switch (toUpperCase()) {
      case 'USD':
        return R.currencySymbols.usd;
      case 'SGD':
        return R.currencySymbols.sgd;
      case 'EUR':
        return R.currencySymbols.eur;
      case 'GBP':
        return R.currencySymbols.gpb;
      case 'JPY':
        return R.currencySymbols.jpy;
      case 'AUD':
        return R.currencySymbols.aud;
      default:
        throw ArgumentError('No Symbol available for currency code: $this');
    }
  }
}
