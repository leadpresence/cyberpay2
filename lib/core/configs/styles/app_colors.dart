import 'package:flutter/material.dart';

/// Styles class holding app color information
/// and helper methods
class AppColors {
  /// App primary color
  static const Color primary = Color(0xff388DCC);

  /// App secondary color
  static const Color secondary = Color(0xff102A43);

  /// App black color
  static const Color black = Color(0xff121212);

  /// App white color
  static const Color white = Color(0xffffffff);
  static const Color red = Color(0xffDC1E38);
  static const Color blue = Color(0xffffffff);
  static const Color ligthBlue = Color(0xffCEECFA);
  static const Color blue_form = Color(0xffCEECFA);
  static const Color blue2 = Color(0xff388DCC);
  static const Color grey = Color(0xffE0E0E0);
  static const Color darkBlue = Color(0xff042F46);
  static const Color darkgrey = Color(0xff9B9494);
  static const Color lemon = Color(0xffCADB2C);
  static const Color dark_background = Color(0xff121212);
  static const Color dark_light_blue= Color(0xff9FB3C8);
  static const Color dark_blue= Color(0xff102A43);
  static const Color dark_blue_stroke= Color(0xff165A8D);
  static const Color dark_nav_blue= Color(0xffBCCCDC);
  static const Color dark_white= Color(0xffffffff);
  static const Color black_light= Color(0xff323232);
  static const Color green = Color(0xFF27AE60);
  static const Color yellow = Color(0xFFFACB0B);




  /// Returns a shade of a [Color] from a double value
  ///
  /// The 'darker' boolean determines whether the shade
  /// should be .1 darker or lighter than the provided color
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}