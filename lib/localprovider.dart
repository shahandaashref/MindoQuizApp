import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', '');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'ar'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    if (_locale.languageCode == 'en') {
      setLocale(const Locale('ar', ''));
    } else {
      setLocale(const Locale('en', ''));
    }
  }
}