import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier{

  var _themeMode=ThemeMode.light;

  ThemeMode get themeMode=>_themeMode;

  void setTheme(themeMode){
    _themeMode=themeMode;
    notifyListeners();
  }
}