import 'dart:io';
import 'dart:convert';

const LOGIN_FILE_PATH = 'data/login.json';
const PROFILE_FILE_PATH = 'data/profile.json';

void clearConsole() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
}

Map loadLogin() {
  final file = File(LOGIN_FILE_PATH);
  final contents = file.readAsStringSync();
  if (contents.isNotEmpty) {
    return json.decode(contents)!;
  }
  return {};
}

void saveLogin(Map _data) {
  Map data = loadLogin();
  data[_data['mail']] = {"password": _data['password'], "id": ""};

  //savejson to file
  final file = File(LOGIN_FILE_PATH);

  file.writeAsStringSync(json.encode(data));
}

void updateLoginWithId(mail, id) {
  Map data = loadLogin();
  data[mail]["id"] = id;

  //savejson to file
  final file = File(LOGIN_FILE_PATH);

  file.writeAsStringSync(json.encode(data));
}

void deleteLogin(mail) {
  Map data = loadLogin();
  data.remove(mail);
  saveLogin(data);
}

Map loadProfile() {
  final file = File(PROFILE_FILE_PATH);
  final contents = file.readAsStringSync();
  if (contents.isNotEmpty) {
    return json.decode(contents)!;
  }
  return {};
}

Map loadProfileById(String id) {
  Map data = loadProfile();
  return data[id];
}

void saveProfile(Map _data) {
  final file = File(PROFILE_FILE_PATH);
  file.writeAsStringSync(json.encode(_data));
}

void saveNewProfile(Map _data, String id) {
  Map data = loadProfile();
  data[id] = _data;
  saveProfile(data);
}

void updateProfileJson(String id, String key, String value) {
  Map data = loadProfile();
  data[id][key] = value;

  saveProfile(data);
}

void deleteProfileById(id) {
  Map data = loadProfile();
  data.remove(id);
  saveProfile(data);
}

String encryptPassword(String pwd) {
  return base64Encode(utf8.encode(pwd));
}

String hiddenInput(String output) {
  print("$output");
  stdin.echoMode = false;
  String result = stdin.readLineSync() ?? '';
  stdin.echoMode = true;
  return result;
}
