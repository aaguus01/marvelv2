import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences
      _prefs; //creamos una variable de SharedPreferences

  static String _userName = '';
  static String _passwd = '';
  static bool _rememberAccount = false;
  static bool _isDarkMode = true;

  static Future init() async {
    _prefs = await SharedPreferences
        .getInstance(); //hacemos un getInstance del SharedPreferences
  }

  /* Getters & Setters*/

  static String get nom {
    return _prefs.getString('userName') ?? _userName;
  }

  static set nom(String value) {
    _userName = value;
    _prefs.setString('userName', value);
  }

  static String get passwd {
    return _prefs.getString('password') ?? _passwd;
  }

  static set passwd(String value) {
    _passwd = value;
    _prefs.setString('password', _passwd);
  }

  static bool get checkRecordar {
    return _prefs.getBool('checkBox') ?? _rememberAccount;
  }

  static set checkRecordar(bool value) {
    _rememberAccount = value;
    _prefs.setBool('checkBox', _rememberAccount);
  }

  static bool get isDarkMode {
    return _prefs.getBool('dark') ??
        _isDarkMode; // si es null tendrá el valor de _nom
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('dark', value);
  }
}
