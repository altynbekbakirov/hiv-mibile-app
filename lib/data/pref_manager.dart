import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String DARKTHEME = "dark_theme";
  static const String LANGUAGE = 'language';
  static const String WITH_REGISTRATION = 'with_registration';
  static const String TOKEN = 'token';
  static const String USER_ID = 'user_id';
  static const String USERNAME = 'username';
  static const String NOTIFICATIONS = 'notifications';
  static const String PASSWORD = 'password';
  static const String SELECTED_PAGE = 'selected_page';
  static const String CHAPTER_ONE = 'chapter_one';
  static const String CHAPTER_TWO = 'chapter_two';
  static const String CHAPTER_THREE = 'chapter_three';
  static const String CHAPTER_FOUR = 'chapter_four';
  static const String CHAPTER_FIVE = 'chapter_five';
  static const String CHAPTER_SIX = 'chapter_six';
  static const String CHAPTER_SEVEN = 'chapter_seven';
  static const String CHAPTER_EIGHT = 'chapter_eight';

  static SharedPreferences _prefs;
  static Map<String, dynamic> _memoryPrefs = Map<String, dynamic>();

  static Future<SharedPreferences> load() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setList(String key, List<String> value) {
    _prefs.setStringList(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String getString(String key, {String def}) {
    String val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getString(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static int getInt(String key, {int def}) {
    int val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getInt(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static double getDouble(String key, {double def}) {
    double val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getDouble(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key, {bool def = false}) {
    bool val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getBool(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static List<String> getList(String key){
    List<String> val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getStringList(key);
    }
    if (val == null) {
      val = new List<String>();
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static Future<void> setLanguage(String langCode) async =>
      await _prefs.setString(Prefs.LANGUAGE, langCode);

  String get languageCode =>
      _prefs.getString(Prefs.LANGUAGE);

  String get getToken => _prefs.getString(Prefs.TOKEN);

  static void clear() {
    _prefs.clear();
  }
}
