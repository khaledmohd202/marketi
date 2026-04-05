import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  factory CacheHelper() => _instance;
  CacheHelper._internal();
  static late SharedPreferences sharedPreferences;


  // Singleton pattern
  static final CacheHelper _instance = CacheHelper._internal();

  // Here The Initialize of cache .
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  // this method to put data in local database using key

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return  sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return  sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return  sharedPreferences.setInt(key, value);
    } else {
      return  sharedPreferences.setDouble(key, value as double);
    }
  }

  // this method to get data already saved in local database

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // remove data using specific key

  Future<bool> removeData({required String key}) async {
    return  sharedPreferences.remove(key);
  }

  // this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

  // this fun to put data in local data base using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return  sharedPreferences.setBool(key, value);
    } else {
      return  sharedPreferences.setInt(key, value as int);
    }
  }
}
