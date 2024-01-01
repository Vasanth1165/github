import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{
   var _themeMode= ThemeMode.light;
   ThemeMode get themeMode=> _themeMode;

   bool _isDark =false;
   bool get isDark => _isDark;

   void setTheme(theme){
     _themeMode=theme;
     _isDark=!_isDark;
     notifyListeners();
   }
}