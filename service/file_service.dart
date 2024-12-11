import 'dart:io';
import 'dart:convert';

const String PROFILE_FILE_PATH = 'data/profile.json';
const String LOGIN_FILE_PATH = 'data/login.json';

class FileService {
  static void saveJson(List _data) {
    final file = File(LOGIN_FILE_PATH);
    file.writeAsStringSync(json.encode(_data));
  }

  static List loadLoginJson() {
    final file = File(LOGIN_FILE_PATH);
    final contents = file.readAsStringSync();
    if (contents.isNotEmpty) {
      return json.decode(contents)!;
    }
    return [];
  }

  static void saveProfileJson(Map _data) {
    final file = File(PROFILE_FILE_PATH);
    file.writeAsStringSync(json.encode(_data));
  }

  static Map loadProfileJson(String) {
    final file = File(PROFILE_FILE_PATH);
    final contents = file.readAsStringSync();
    if (contents.isNotEmpty) {
      return json.decode(contents)!;
    }
    return {};
  }
}
