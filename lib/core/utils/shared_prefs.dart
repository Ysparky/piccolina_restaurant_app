import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  SharedPreferences _preferences;

  void initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String get login {
    return _preferences.getString('login') ?? null;
  }

  set login(String loginInfo) {
    _preferences.setString('login', loginInfo);
  }

  String get token {
    return _preferences.getString('token') ?? null;
  }

  set token(String userToken) {
    _preferences.setString('token', userToken);
  }

  removeAuthSession() {
    _preferences.remove('token');
    _preferences.remove('login');
  }
}
