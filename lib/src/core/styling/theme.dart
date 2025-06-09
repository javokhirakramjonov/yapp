import 'package:flutter/material.dart';
import 'package:yapp/src/core/styling/font.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color primary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color primarySurface;
  final Color secondarySurface;
  final Color background;
  final Color onSurface20;
  final Color onSurface40;
  final Color onSurface60;

  const AppTheme({
    required this.primary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.primarySurface,
    required this.secondarySurface,
    required this.background,
    required this.onSurface20,
    required this.onSurface40,
    required this.onSurface60,
  });

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primarySurface,
    Color? secondarySurface,
    Color? background,
    Color? onSurface20,
    Color? onSurface40,
    Color? onSurface60,
  }) {
    return AppTheme(
      primary: primary ?? this.primary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      primarySurface: primarySurface ?? this.primarySurface,
      secondarySurface: secondarySurface ?? this.secondarySurface,
      background: background ?? this.background,
      onSurface20: onSurface20 ?? this.onSurface20,
      onSurface40: onSurface40 ?? this.onSurface40,
      onSurface60: onSurface60 ?? this.onSurface60,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryContainer: Color.lerp(
        primaryContainer,
        other.primaryContainer,
        t,
      )!,
      onPrimaryContainer: Color.lerp(
        onPrimaryContainer,
        other.onPrimaryContainer,
        t,
      )!,
      primarySurface: Color.lerp(primarySurface, other.primarySurface, t)!,
      secondarySurface: Color.lerp(
        secondarySurface,
        other.secondarySurface,
        t,
      )!,
      background: Color.lerp(background, other.background, t)!,
      onSurface20: Color.lerp(onSurface20, other.onSurface20, t)!,
      onSurface40: Color.lerp(onSurface40, other.onSurface40, t)!,
      onSurface60: Color.lerp(onSurface60, other.onSurface60, t)!,
    );
  }
}

const AppTheme lightTheme = AppTheme(
  primary: Color(0xFF1B72C0),
  primaryContainer: Color(0xFFD3E4FF),
  onPrimaryContainer: Color(0xFF001C38),
  primarySurface: Color(0xFFF3F4F9),
  secondarySurface: Color(0xFFEFF1F8),
  background: Color(0xFFFCFCFF),
  onSurface20: Color(0xFF001E2F),
  onSurface40: Color(0xFF44474E),
  onSurface60: Color(0xFF74777F),
);

const AppTheme darkTheme = AppTheme(
  primary: Color(0xFFA2C9FF),
  primaryContainer: Color(0xFF2F4156),
  onPrimaryContainer: Color(0xFFD7E2FF),
  primarySurface: Color(0xFF13232C),
  secondarySurface: Color(0xFF1E2A32),
  background: Color(0xFF0E181E),
  onSurface20: Color(0xFFE0F1FF),
  onSurface40: Color(0xFFBFC6DA),
  onSurface60: Color(0xFFA8ADBD),
);

final ThemeData lightThemeData = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightTheme.primary,
    primary: lightTheme.primary,
    primaryContainer: lightTheme.primaryContainer,
    onPrimaryContainer: lightTheme.onPrimaryContainer,
    surface: lightTheme.primarySurface,
  ),
  textTheme: AppFont.theme,
  extensions: <ThemeExtension<AppTheme>>[lightTheme],
);

final ThemeData darkThemeData = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkTheme.primary,
    primary: darkTheme.primary,
    primaryContainer: darkTheme.primaryContainer,
    onPrimaryContainer: darkTheme.onPrimaryContainer,
    surface: darkTheme.primarySurface,
  ),
  textTheme: AppFont.theme,
  extensions: <ThemeExtension<AppTheme>>[darkTheme],
);

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
