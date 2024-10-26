import 'currency_symbols.dart';
import 'flags.dart';
import 'image_assets.dart';
import 'icon_assets.dart';
import 'strings.dart';

abstract class R {
  static final flags = CurrencyFlags();
  static final currencySymbols = CurrencySymbols();
  static final icons = AppIconAssets();
  static final images = AppImageAssets();
  static final strings = AppStrings();
}
