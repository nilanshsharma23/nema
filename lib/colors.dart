import 'package:material_ui/material_ui.dart';

class LightModeColors {
  static const textColor = Color(0xFF3B3430);
  static const backgroundColor = Color(0xFFF3EEE6);
  static const primaryColor = Color(0xFFA9BA9E);
  static const primaryFgColor = Color(0xFF3B3430);
  static const secondaryColor = Color(0xFFF1E3C6);
  static const secondaryFgColor = Color(0xFF3B3430);
  static const accentColor = Color(0xFFB9B3CC);
  static const accentFgColor = Color(0xFF3B3430);
  static const cardColor = Color(0xFFFBF8F3);

  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error: Brightness.light == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    surfaceContainer: cardColor,
    onError: Brightness.light == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  );
}

class DarkModeColors {
  static const textColor = Color(0xFFEDE6DC);
  static const backgroundColor = Color(0xFF1E1A18);
  static const primaryColor = Color(0xFFA9BA9E);
  static const primaryFgColor = Color(0xFF1E1A18);
  static const secondaryColor = Color(0xFFA39A8F);
  static const secondaryFgColor = Color(0xFF1E1A18);
  static const accentColor = Color(0xFF9C96B5);
  static const accentFgColor = Color(0xFF1E1A18);
  static const cardColor = Color(0xFF282320);

  static const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error: Brightness.dark == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    surfaceContainer: cardColor,
    onError: Brightness.dark == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  );
}
