import 'dart:io';
import 'dart:convert';

const LOGIN_FILE_PATH = 'data/login.json';

Map loadLoginJson() {
  final file = File(LOGIN_FILE_PATH);
  final contents = file.readAsStringSync();
  if (contents.isNotEmpty) {
    return json.decode(contents)!;
  }
  return {};
}

void saveLogin(Map _data) {
  Map data = loadLoginJson();
  data[_data['mail']] = {"password": _data['password'], "id": ""};
  saveJson(data);
}

void updateLoginWithId(mail, id) {
  Map data = loadLoginJson();
  data[mail]["id"] = id;
  saveJson(data);
}

void deleteLogin(mail) {
  Map data = loadLoginJson();
  data.remove(mail);
  saveJson(data);
}

void saveJson(Map _data) {
  final file = File(LOGIN_FILE_PATH);
  file.writeAsStringSync(json.encode(_data));
}
