import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

/// Theme preference for app
class ThemePref {
  static const themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(themeStatus) as FutureOr<bool>? ?? false;
  }
}