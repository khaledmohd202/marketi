import 'package:flutter/material.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class AppTheme {
  // Dark Theme
  static const Color _primaryColor = MarketiColors.darkBlue100Color;
  static const Color _lightBackground = Colors.white;
  static const Color _darkBackground = MarketiColors.backgroundColorDarkTheme;

  static ThemeData _buildTheme({required bool isDark}) => ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: isDark ? _darkBackground : _lightBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? _darkBackground : _lightBackground,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: isDark ? Colors.white : Colors.black,
      ),
      titleTextStyle: MarketiTextStyles.textStyle22.copyWith(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateColor.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? Colors.white : Colors.grey,
      ),
      trackColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? _primaryColor
            : Colors.grey.withValues(alpha: 0.3),
      ),
    ),
  );

  static ThemeData get light => _buildTheme(isDark: false);
  static ThemeData get dark => _buildTheme(isDark: true);
}
