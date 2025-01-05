import 'package:shared_preferences/shared_preferences.dart';
import 'package:telsa_mobile/core/constants/constants.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  late SharedPreferences _preferences;

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Method để lưu token
  Future<void> setToken(String token) async {
    await _preferences.setString(Constants.token, token);
  }

  // Method để lấy token
  String? getToken() {
    return _preferences.getString(Constants.token);
  }

  // Method để xóa token
  Future<void> removeToken() async {
    await _preferences.remove(Constants.token);
  }

  //Method để lưu cookies
  Future<void> setCookies(List<String> cookies) async {
    for (var cookie in cookies) {
      if (cookie.contains('access_token=')) {
        await _preferences.setString(Constants.accessToken, cookie);
      } else if (cookie.contains('refresh_token=')) {
        await _preferences.setString(Constants.refreshToken, cookie);
      }
    }
  }

  //Method để lấy cookies
  String? getCookies() {
    String cookie =
        '${_preferences.getString(Constants.accessToken) ?? ''};${_preferences.getString(Constants.refreshToken) ?? ''}';
    return cookie != ';' ? cookie : '';
  }

  // Method để lưu  trạng thái ghi nhớ đăng nhập
  Future<void> setRememberLogin(bool rememberLogin) async {
    await _preferences.setBool(Constants.isRememberLogin, rememberLogin);
  }

  // Method để lấy trạng thái lưu đăng nhập
  bool? getIsRememberLogin() {
    return _preferences.getBool(Constants.isRememberLogin);
  }
}
