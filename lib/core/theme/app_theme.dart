import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final _flexSchemeColorLight = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFF6750A4),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFEADDFF),
    onPrimaryContainer: const Color(0xFF21005D),
    primaryFixed: const Color(0xFFEADDFF),
    primaryFixedDim: const Color(0xFFD0BCFF),
    onPrimaryFixed: const Color(0xFF21005D),
    onPrimaryFixedVariant: const Color(0xFF4F378B),
    secondary: const Color(0xFF625B71),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFFE8DEF8),
    onSecondaryContainer: const Color(0xFF1D192B),
    secondaryFixed: const Color(0xFFE8DEF8),
    secondaryFixedDim: const Color(0xFFCCC2DC),
    onSecondaryFixed: const Color(0xFF1D192B),
    onSecondaryFixedVariant: const Color(0xFF4A4458),
    tertiary: const Color(0xFF7D5260),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFFFFD8E4),
    onTertiaryContainer: const Color(0xFF31111D),
    tertiaryFixed: const Color(0xFFFFD8E4),
    tertiaryFixedDim: const Color(0xFFEFB8C8),
    onTertiaryFixed: const Color(0xFF31111D),
    onTertiaryFixedVariant: const Color(0xFF633B48),
    error: const Color(0xFFB3261E),
    onError: const Color(0xFFFFFFFF),
    errorContainer: const Color(0xFFF9DEDC),
    onErrorContainer: const Color(0xFF410E0B),
    surface: const Color(0xFFFEF7FF),
    surfaceBright: const Color(0xFFFEF7FF),
    surfaceContainerLowest: const Color(0xFFFFFFFF),
    surfaceContainerLow: Colors.grey.withOpacity(0.1),
    surfaceContainer: const Color(0xFFF3EDF7),
    surfaceContainerHigh: const Color(0xFFECE6F0),
    surfaceContainerHighest: const Color(0xFFE6E0E9),
    surfaceDim: const Color(0xFFDED8E1),
    onSurface: const Color(0xFF1D1B20),
    onSurfaceVariant: const Color(0xFF49454F),
    outline: const Color(0xFF79747E),
    outlineVariant: const Color(0xFFCAC4D0),
    shadow: const Color(0xFF000000),
    scrim: const Color(0xFF000000),
    inverseSurface: const Color(0xFF322F35),
    onInverseSurface: const Color(0xFFF5EFF7),
    inversePrimary: const Color(0xFFD0BCFF),
    // The surfaceTint color is set to the same color as the primary.
    surfaceTint: const Color(0xFF6750A4),
  );

  static const _flexSchemeColorDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    primaryFixed: Color(0xFFEADDFF),
    primaryFixedDim: Color(0xFFD0BCFF),
    onPrimaryFixed: Color(0xFF21005D),
    onPrimaryFixedVariant: Color(0xFF4F378B),
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    secondaryFixed: Color(0xFFE8DEF8),
    secondaryFixedDim: Color(0xFFCCC2DC),
    onSecondaryFixed: Color(0xFF1D192B),
    onSecondaryFixedVariant: Color(0xFF4A4458),
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    tertiaryFixed: Color(0xFFFFD8E4),
    tertiaryFixedDim: Color(0xFFEFB8C8),
    onTertiaryFixed: Color(0xFF31111D),
    onTertiaryFixedVariant: Color(0xFF633B48),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    surface: Color(0xFF141218),
    surfaceBright: Color(0xFF3B383E),
    surfaceContainerLowest: Color(0xFF0F0D13),
    surfaceContainerLow: Color(0xFF1D1B20),
    surfaceContainer: Color(0xFF211F26),
    surfaceContainerHigh: Color(0xFF2B2930),
    surfaceContainerHighest: Color(0xFF36343B),
    surfaceDim: Color(0xFF141218),
    onSurface: Color(0xFFE6E0E9),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE6E0E9),
    onInverseSurface: Color(0xFF322F35),
    inversePrimary: Color(0xFF6750A4),
    // The surfaceTint color is set to the same color as the primary.
    surfaceTint: Color(0xFFD0BCFF),
  );

  static ThemeData get lightTheme => FlexThemeData.light(
        useMaterial3ErrorColors: true,
        colorScheme: _flexSchemeColorLight,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        scaffoldBackground: const Color(0xFFF3F3F3),
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        textTheme: TextTheme(
          // Dùng cho font chữ nút bấm
          labelLarge: TextStyle(
            color: _flexSchemeColorLight.onPrimary,
            fontSize: 17,
          ),
          // Dùng cho nội dung chính
          bodyLarge: TextStyle(
            color: _flexSchemeColorLight.onPrimaryContainer,
            fontSize: 16,
          ),
          // Dùng cho tiêu đề trong phần nội dung
          titleLarge: TextStyle(
            color: _flexSchemeColorLight.onSurface,
            fontSize: 21,
          ),
          // Dùng cho tiêu đề trong phần nội dung nhỏ hơn
          titleMedium: TextStyle(
            color: _flexSchemeColorLight.onPrimaryContainer,
            fontSize: 16,
          ),
          // Dùng cho tiêu đề lớn trong page
          headlineLarge: TextStyle(
            color: _flexSchemeColorLight.onSecondary,
            fontSize: 30,
          ),
          // Dùng cho tiêu đề vừa trong page
          headlineMedium: TextStyle(
            color: _flexSchemeColorLight.onSecondary,
            fontSize: 17,
          ),
          // Dùng tuỳ chọn
          displayLarge: TextStyle(
            color: _flexSchemeColorLight.onSecondary,
            fontSize: 16,
          ),
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      );

  static ThemeData get darkTheme => FlexThemeData.dark(
        colorScheme: _flexSchemeColorDark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        textTheme: TextTheme(
          // Dùng cho font chữ nút bấm
          labelLarge: TextStyle(
            color: _flexSchemeColorDark.onPrimary,
            fontSize: 17,
          ),
          // Dùng cho nội dung chính
          bodyLarge: TextStyle(
            color: _flexSchemeColorDark.onSecondaryContainer,
            fontSize: 16,
          ),
          // Dùng cho tiêu đề trong phần nội dung
          titleLarge: TextStyle(
            color: _flexSchemeColorDark.onSurface,
            fontSize: 21,
          ),
          // Dùng cho tiêu đề trong phần nội dung nhỏ hơn
          titleMedium: TextStyle(
            color: _flexSchemeColorDark.onPrimaryContainer,
            fontSize: 16,
          ),
          // Dùng cho tiêu đề lớn trong page
          headlineLarge: TextStyle(
            color: _flexSchemeColorDark.onSecondary,
            fontSize: 30,
          ),
          // Dùng cho tiêu đề vừa trong page
          headlineMedium: TextStyle(
            color: _flexSchemeColorDark.onSecondary,
            fontSize: 17,
          ),
          // Dùng tuỳ chọn
          displayLarge: TextStyle(
            color: _flexSchemeColorDark.onSecondary,
            fontSize: 16,
          ),
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: false,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      );
}
