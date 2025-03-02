import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<T?> get<T>(String key) async {
    final prefs = await _prefs;
    return prefs.get(key) as T?;
  }

  Future<Map<String, dynamic>> getAll(Set<String> keys) async {
    final prefs = await _prefs;
    final responses = <String, dynamic>{};

    for (final key in keys) {
      responses[key] = prefs.get(key);
    }

    return responses;
  }

  Future<void> set(String key, {required dynamic data}) async {
    final prefs = await _prefs;
    await _setPreference(prefs, key, data);
  }

  Future<void> setAll(Map<String, dynamic> values) async {
    final prefs = await _prefs;
    final futures = values.entries.map((entry) {
      return _setPreference(prefs, entry.key, entry.value);
    }).toList();
    await Future.wait(futures);
  }

  Future<void> _setPreference(
    SharedPreferences prefs,
    String key,
    dynamic data,
  ) async {
    if (data is bool) {
      await prefs.setBool(key, data);
    } else if (data is String) {
      await prefs.setString(key, data);
    } else if (data is List<String>) {
      await prefs.setStringList(key, data);
    } else if (data is int) {
      await prefs.setInt(key, data);
    } else if (data is double) {
      await prefs.setDouble(key, data);
    }
  }

  Future<void> delete(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  Future<void> deleteAll(Set<String> keys) async {
    final prefs = await _prefs;
    final futures = keys.map((key) => prefs.remove(key)).toList();
    await Future.wait(futures);
  }
}
