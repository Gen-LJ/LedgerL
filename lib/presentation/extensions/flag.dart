import 'package:ledger_l/presentation/presentation.dart';

extension Flag on String {
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
}
