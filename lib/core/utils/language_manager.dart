import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pos_today/core/di/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

String stringResource(String type, String key) {
  return di.get<LanguageManager>().getString(type, key);
}

class LanguageManager {
  final Map<String, Map<String, String>> _resource;

  LanguageManager._(this._resource);

  static Future<LanguageManager> initialize({required SharedPreferencesAsync sharedPref}) async {
    try {
      final local =
          await sharedPref.getString("language") ??
          "en"; //fall back to en resource if language not set
      final jsonString = await rootBundle.loadString(
        "assets/localization/$local.json",
      );

      // convert string to map
      final decodeResult = json.decode(jsonString);

      // map resources
      final Map<String, Map<String, String>>
      result = decodeResult.map<String, Map<String, String>>((key, value) {
        final Map<String, String> valueMap = value.map<String, String>((k, v) {
          return MapEntry<String, String>(k.toString(), v.toString());
        });

        return MapEntry<String, Map<String, String>>(key.toString(), valueMap);
      });
      return LanguageManager._(result);
    } catch (e) {
      return LanguageManager._({});
    }
  }

  String getString(String type, String key) {
    // difference type resource base on feature
    // exp: home,cart,profile
    final typeResource = _resource[type];

    // if type doesn't not initialize use #key as value
    if (typeResource == null) return key;

    // default value of result is key pass from screen
    String result = key;

    // find existing value and assign to result or els use key as value
    result = typeResource[key] ?? key;

    return result;
  }
}
