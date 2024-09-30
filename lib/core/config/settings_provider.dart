import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeCurrentTheme(ThemeMode newTheme) {
    // final SharedPreferences preferences= await SharedPreferences.getInstance();
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return (currentTheme == ThemeMode.dark);
  }

  bool isArabic() {
    return (currentLanguage == "en");
  }
}
