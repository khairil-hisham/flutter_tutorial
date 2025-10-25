import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String _username = '';
  bool _darkMode = false;

  String get username => _username;
  bool get darkMode => _darkMode;

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }

  void setDarkMode(bool state) {
    _darkMode = state;
    notifyListeners();
  }
}
