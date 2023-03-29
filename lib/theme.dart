import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.green, primary: Colors.white)),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);
ThemeData red = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.red, primary: Colors.white)),
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemecolorData with ChangeNotifier {
  bool _isGreen = false;
  static SharedPreferences? _sharedPrefObj;
  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  bool get isGreen => _isGreen;
  void toggleTheme() {
    _isGreen = !_isGreen;
    saveSharedpref(_isGreen);
    notifyListeners();
  }

  Future<void> createSharedPrefObj() async {
    _sharedPrefObj = await SharedPreferences.getInstance();
  }

  void saveSharedpref(bool value) {
    _sharedPrefObj?.setBool('Themedata', value);
  }

  void loadThemeFromSharedPred() async {
    await createSharedPrefObj();
    _isGreen = _sharedPrefObj?.getBool('Themedata') ?? true;
  }
}
