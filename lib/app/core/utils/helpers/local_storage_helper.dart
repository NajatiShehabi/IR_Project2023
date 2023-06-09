import 'dart:async';
import 'dart:convert';

import 'package:ir_project/app/core/utils/failures/local_storage_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  SharedPreferences preferences;

  LocalStorageHelper(this.preferences);

  Future<bool> store(String path, {required Map<String, dynamic> data}) async {
    String textData = jsonEncode(data);
    return preferences.setString(path, textData);
  }

  Future<bool> delete(String path) async {
    return preferences.remove(path);
  }

  T read<T>(String path, {required T Function(Map<String, dynamic>) decoder}) {
    String? textData = preferences.getString(path);
    if (textData == null) {
      throw const DataNotExist();
    } else {
      return decoder(jsonDecode(textData));
    }
  }
}
