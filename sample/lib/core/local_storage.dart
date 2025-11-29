import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

late SharedPreferences _prefs;

/// PrefItemsで利用するSharedPreferencesの初期化を行う。
///
/// アプリの初期化時に呼び出してください
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await initPrefs();
///   ...
///   runApp(const MyApp());
/// }
/// ```
Future<void> initPrefs() async {
  _prefs = await SharedPreferences.getInstance();
}

/// すべての保存項目をクリアします
Future<void> clearPrefs() async {
  for (var key in _prefs.getKeys()) {
    await _prefs.remove(key);
  }
}

/// ローカルに保存する設定項目とその型の一覧
enum PrefItems<T> {
  // 項目を追加する場合、下の"get"および"set"関数の中に
  // 追加する項目の型の処理がないようであれば、処理を追加して下さい。
  themeMode<ThemeMode>(defaultValue: ThemeMode.system),
  deviceUuid<String?>(defaultValue: null),
  expenses<List<String>>(defaultValue: <String>[]);

  const PrefItems({required this.defaultValue});

  /// デフォルト値
  final T defaultValue;

  /// 保存してある項目のデータを取得。
  ///
  /// ローカルにデータが保存されていれば[T]型でその値を取得、保存されていなければデフォルト値を返す。
  /// デフォルト値も設定されていなければnullを返す。
  T get() {
    if (_prefs.get(name) == null) return defaultValue;

    if (T == bool) return _prefs.getBool(name) as T;
    if (T == double) return _prefs.getDouble(name) as T;
    if (T == int) return _prefs.getInt(name) as T;
    if (T == String) return _prefs.getString(name) as T;
    if (T == List<String>) return _prefs.getStringList(name) as T;
    if (T == Decimal) return Decimal.parse(_prefs.getString(name)!) as T;
    if (T == DateTime) return DateTime.parse(_prefs.getString(name)!) as T;
    if (T == ThemeMode) {
      return ThemeMode.values.byName(_prefs.getString(name)!) as T;
    }
    throw Exception("Unexpected type for PrefItems: $T");
  }

  /// ローカルにデータを保存する。
  Future<bool> set(T value) {
    if (value is bool) return _prefs.setBool(name, value);
    if (value is double) return _prefs.setDouble(name, value);
    if (value is int) return _prefs.setInt(name, value);
    if (value is String) return _prefs.setString(name, value);
    if (value is List<String>) return _prefs.setStringList(name, value);
    if (value is Decimal) return _prefs.setString(name, value.toString());
    if (value is DateTime) return _prefs.setString(name, value.toString());
    if (value is ThemeMode) return _prefs.setString(name, value.name);
    throw Exception("Unexpected type for PrefItems: $T");
  }

  /// ローカルに保存してあるデータを削除する。
  Future<bool> remove() {
    return _prefs.remove(name);
  }
}

/// FlutterSecureStorageのインスタンスを格納するグローバル変数
///
/// パスワードの格納などに利用する
const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

/// ローカルに暗号化して保存する項目の一覧
///
/// パスワードなどの重要なデータを保存するために利用します。
/// String型のみを許容します。
enum SecureStorageItems {
  password;

  /// ローカルに保存してあるデータを取得。
  Future<String?> get() => _secureStorage.read(key: name);

  /// ローカルにデータを保存する。
  Future<void> set(String value) =>
      _secureStorage.write(key: name, value: value);

  /// ローカルに保存してあるデータを削除する。
  Future<void> remove() => _secureStorage.delete(key: name);
}
