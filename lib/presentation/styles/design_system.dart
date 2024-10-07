// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'colors.dart';
import 'grid.dart';
import 'shadow.dart';
import 'sizes.dart';
import 'typography.dart';
import 'extensions/text_style.dart';

enum ScreenType { sm, md, lg }

class AppStyles {
  static const int tabletXl = 1000;
  static const int tabletLg = 800;

  final double scale;
  final bool useMaterial3;
  final Size? screenSize;
  final Locale? locale;
  final ThemeMode themeMode;
  final ScreenType screenType;

  double? get width => screenSize?.width;

  double? get height => screenSize?.height;

  bool get isLandscape => (width ?? 0) > (height ?? 0);

  bool get isPortrait => !isLandscape;

  bool get isMobile => width == null || width! <= 480;

  AppStyles({
    this.themeMode = ThemeMode.light,
    this.screenSize,
    this.useMaterial3 = true,
    this.locale,
  })  : screenType = screenSize == null
            ? ScreenType.sm
            : screenSize.shortestSide > tabletXl
                ? ScreenType.lg
                : screenSize.shortestSide > tabletLg
                    ? ScreenType.md
                    : ScreenType.sm,
        scale = screenSize == null //screen sized is undetermined
            ? 1
            : screenSize.shortestSide > tabletXl //screen size is xl
                ? 1.2
                : screenSize.shortestSide > tabletLg //screen size is lg
                    ? 1.1
                    : 1; // screen size is small

  late final typography = _Typography(locale);
  late final color = _Colors(useMaterial3, typography);
  late final insets = _Insets(scale);
  late final corner = _Corners();
  late final time = _Times();
  late final spacing = _Spacings();
  late final size = _Sizes();
  late final grid = _GridSystem(screenSize ?? Size.zero);
  late final _shadow = _Shadows();

  Shadows get shadow =>
      themeMode == ThemeMode.light ? _shadow.light : _shadow.dark;

  late final _lightTextTheme = typography.light;
  late final _darkTextTheme = typography.dark;

  late final light = color.light.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: color.clrWhite,
    appBarTheme: color.light.appBarTheme.copyWith(
      backgroundColor: color.clrWhite,
      titleTextStyle: _lightTextTheme.titleMedium,
      iconTheme: color.light.iconTheme.copyWith(
        color: color.light.colorScheme.primary,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: color.clrSofterGrey
    ),
    textTheme: typography.light.copyWith(
      displayLarge: _lightTextTheme.displayLarge?.bold,
      displayMedium: _lightTextTheme.displayMedium?.bold,
      displaySmall: _lightTextTheme.displaySmall?.bold,
      titleLarge: _lightTextTheme.bodyLarge?.bold,
      titleMedium: _lightTextTheme.bodyMedium?.semiBold,
      titleSmall: _lightTextTheme.bodySmall?.semiBold,
      bodyLarge: _lightTextTheme.bodyLarge?.regular.copyWith(
        color: _lightTextTheme.bodyLarge!.color?.withOpacity(0.9),
      ),
      bodyMedium: _lightTextTheme.bodyMedium?.regular.copyWith(
        color: _lightTextTheme.bodyMedium!.color?.withOpacity(0.9),
      ),
      bodySmall: _lightTextTheme.bodySmall?.regular.copyWith(
        color: _lightTextTheme.bodySmall!.color?.withOpacity(0.6),
      ),
      labelLarge: _lightTextTheme.labelLarge?.regular,
      labelMedium: _lightTextTheme.labelMedium?.regular,
      labelSmall: _lightTextTheme.labelSmall?.regular,
    ),
  );
  late final dark = color.dark.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: color.dark.scaffoldBackgroundColor,
      titleTextStyle: _lightTextTheme.titleMedium?.copyWith(
        color: color.dark.colorScheme.onPrimary,
      ),
      iconTheme: color.dark.iconTheme.copyWith(
        color: color.dark.colorScheme.primary,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: color.dark.colorScheme.primary,
    ),
    textTheme: typography.light.copyWith(
      displayLarge: _darkTextTheme.displayLarge?.bold,
      displayMedium: _darkTextTheme.displayMedium?.bold,
      displaySmall: _darkTextTheme.displaySmall?.bold,
      titleLarge: _darkTextTheme.bodyLarge?.bold,
      titleMedium: _darkTextTheme.bodyMedium?.semiBold,
      titleSmall: _darkTextTheme.bodySmall?.semiBold,
      bodyLarge: _darkTextTheme.bodyLarge?.regular.copyWith(
        color: _darkTextTheme.bodyLarge!.color?.withOpacity(0.9),
      ),
      bodyMedium: _darkTextTheme.bodyMedium?.regular.copyWith(
        color: _darkTextTheme.bodyMedium!.color?.withOpacity(0.9),
      ),
      bodySmall: _darkTextTheme.bodySmall?.regular.copyWith(
        color: _darkTextTheme.bodySmall!.color?.withOpacity(0.6),
      ),
      labelLarge: _darkTextTheme.labelLarge?.regular,
      labelMedium: _darkTextTheme.labelMedium?.regular,
      labelSmall: _darkTextTheme.labelSmall?.regular,
    ),
  );
}

class _Colors {
  final _Typography _typography;
  final bool _useMaterial3;

  _Colors(this._useMaterial3, this._typography);

  Color get clrSuccess => AppColors.clrSuccess;

  Color get clrPrimary => AppColors.clrPrimary;

  Color get clrSecondary => AppColors.clrSecondary;

  Color get clrWhite => AppColors.clrWhite;

  Color get clrBlack => AppColors.clrBlack;

  Color get clrBlue => AppColors.clrBlue;

  Color get clrRed => AppColors.clrRed;

  Color get clrSofterGrey => AppColors.clrSofterGrey;

  Color get clrSoftGrey => AppColors.clrSoftGrey;

  Color get clrGrey => AppColors.clrGrey;

  Color get clrDarkGrey => AppColors.clrDarkGrey;

  Color get clrDarkerGrey => AppColors.clrDarkerGrey;

  Gradient linearGradient() {
    return const LinearGradient(
      colors: [AppColors.clrPrimary, AppColors.clrSecondary],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  static const _lightColorScheme = ColorScheme(
    surfaceTint: Colors.transparent,
    brightness: Brightness.light,
    primary: AppColors.clrPrimary,
    // primary: AppColors.clrSecondary,
    onPrimary: AppColors.clrWhite,
    secondary: AppColors.clrSecondary,
    onSecondary: AppColors.clrWhite,
    error: AppColors.clrRed,
    onError: AppColors.clrWhite,
    background: AppColors.clrSofterGrey,
    onBackground: AppColors.clrBlack,
    surface: AppColors.clrWhite,
    onSurface: AppColors.clrBlack,
  );

  static const _darkColorScheme = ColorScheme(
    surfaceTint: Colors.transparent,
    brightness: Brightness.dark,
    primary: AppColors.clrSecondary,
    // primary: AppColors.clrSecondary,
    onPrimary: AppColors.clrWhite,
    secondary: AppColors.clrPrimary,
    onSecondary: AppColors.clrWhite,
    error: AppColors.clrRed,
    onError: AppColors.clrWhite,
    background: AppColors.clrBlack,
    onBackground: AppColors.clrWhite,
    surface: AppColors.clrOffBlack,
    onSurface: AppColors.clrWhite,
  );

  late final light = ThemeData.from(
    useMaterial3: _useMaterial3,
    colorScheme: _lightColorScheme,
    textTheme: _typography.light,
  );

  late final dark = ThemeData.from(
    useMaterial3: _useMaterial3,
    colorScheme: _darkColorScheme,
    textTheme: _typography.light,
  ).copyWith(
    primaryColor: _darkColorScheme.primary,
    canvasColor: _darkColorScheme.background,
    scaffoldBackgroundColor: _darkColorScheme.background,
  );
}

class _Insets {
  _Insets(this._scale);

  final double _scale;

  /// equalivalent to 4px if scale is 1.0
  late final double xxs = AppSizes.size50 * _scale;

  /// equalivalent to 8px if scale is 1.0
  late final double xs = AppSizes.size100 * _scale;

  /// equalivalent to 16px if scale is 1.0
  late final double sm = AppSizes.size200 * _scale;

  /// equalivalent to 24px if scale is 1.0
  late final double md = AppSizes.size300 * _scale;

  /// equalivalent to 32px if scale is 1.0
  late final double lg = AppSizes.size400 * _scale;

  /// equalivalent to 48px if scale is 1.0
  late final double xl = AppSizes.size600 * _scale;

  /// equalivalent to 56px if scale is 1.0
  late final double xxl = AppSizes.size700 * _scale;

  /// equalivalent to 72px if scale is 1.0
  late final double offset = AppSizes.size900 * _scale;
}

class _Corners {
  _Corners();

  late final double sm = AppSizes.size50;
  late final double md = AppSizes.size100;
  late final double lg = AppSizes.size200;
}

class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

class _Typography {
  final AppTypography _appTypography;

  _Typography(Locale? locale) : _appTypography = AppTypography(locale);

  late final light = _appTypography.light;
  late final dark = _appTypography.dark;
}

class _GridSystem {
  final Size size;

  _GridSystem(this.size);

  static const double _maxMobileWidth = 600;
  static const double _maxTabletWidth = 1280;

  int get columns => _grid.columns;

  double get columnsGutter => _grid.columnsGutter;

  double get columnsMargin => _grid.columnsMargin;

  double get rowPx => _grid.rowPx;

  double get rowsGutter => _grid.rowsGutter;

  double get maxWidth => _grid.maxWidth;

  DesignGridSystem get _grid {
    if (size.width < _maxMobileWidth) return AppGridSystem.mobile;
    if (size.width < _maxTabletWidth) return AppGridSystem.tablet;
    return AppGridSystem.desktop;
  }

  T getValueFor<T>(T mobile, {T? tablet, T? desktop}) {
    if (size.width < _maxMobileWidth) return mobile;
    if (size.width < _maxTabletWidth) return tablet ?? mobile;
    return desktop ?? tablet ?? mobile;
  }
}

class _Spacings {
  _Spacings();

  late final double spacing50 = AppSizes.size50;
  late final double spacing100 = AppSizes.size100;
  late final double spacing200 = AppSizes.size200;
  late final double spacing300 = AppSizes.size300;
  late final double spacing400 = AppSizes.size400;
  late final double spacing500 = AppSizes.size500;
  late final double spacing600 = AppSizes.size600;
  late final double spacing700 = AppSizes.size700;
  late final double spacing800 = AppSizes.size800;
  late final double spacing900 = AppSizes.size900;
}

class _Sizes {
  _Sizes();

  late final double size50 = AppSizes.size50;
  late final double size100 = AppSizes.size100;
  late final double size200 = AppSizes.size200;
  late final double size300 = AppSizes.size300;
  late final double size400 = AppSizes.size400;
  late final double size500 = AppSizes.size500;
  late final double size600 = AppSizes.size600;
  late final double size700 = AppSizes.size700;
  late final double size800 = AppSizes.size800;
  late final double size900 = AppSizes.size900;
}

class _Shadows {
  _Shadows();

  late final light = AppShadows.light;
  late final dark = AppShadows.dark;
}
