import 'package:shared_preferences/shared_preferences.dart';

class SaveId {
  static late SharedPreferences _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future saveId(String id) async {
    var result = await _preferences.setString("id", id);
    print(result);
  }

  static getId() {
    return _preferences.getString("id");
  }

  static delectId() async {
    var result = await _preferences.remove("id");
    print(result);
  }
}
