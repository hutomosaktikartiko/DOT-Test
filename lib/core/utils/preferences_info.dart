import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesInfo {
  // Set Data
  set isLogin(bool value);

  // Get Stored Data
  bool get isLogin;
}

class PreferencesInfoImpl implements PreferencesInfo {
  final SharedPreferences shared;

  PreferencesInfoImpl({required this.shared});

  @override
  set isLogin(bool value) => shared.setBool("is_login", value);

  @override
  bool get isLogin => shared.getBool("is_login") ?? false;

  static Future<PreferencesInfo> instance() => SharedPreferences.getInstance()
      .then((value) => PreferencesInfoImpl(shared: value));
}
