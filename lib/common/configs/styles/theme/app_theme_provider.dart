
import 'package:cyberpay_mobile_2/common/configs/styles/theme/theme_pref.dart';
import 'package:flutter/cupertino.dart';


/// Class instance of the [DarkThemeProvider]
class DarkThemeProvider with ChangeNotifier {
  ThemePref darkThemePref = ThemePref();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}