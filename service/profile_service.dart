import 'dart:io';
import 'dart:convert';

const PROFILE_FILE_PATH = 'data/profile.json';

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

void saveProfile(Map _data) {
  final file = File(PROFILE_FILE_PATH);
  file.writeAsStringSync(json.encode(_data));
}
