import 'file_service.dart';

class ProfileService {
  static Map loadProfile(String id) {
    Map data = FileService.loadProfileJson(PROFILE_FILE_PATH);

    return data[id];
  }

  static void saveProfile(Map _data, String id) {
    Map data = FileService.loadProfileJson(PROFILE_FILE_PATH);
    data[id] = _data;

    FileService.saveProfileJson(data);
  }

  static void updateProfile(String id, String key, String value) {
    Map data = FileService.loadProfileJson(PROFILE_FILE_PATH);
    data[id][key] = value;

    FileService.saveProfileJson(data);
  }

  static void deleteProfile(id) {
    Map data = FileService.loadProfileJson(PROFILE_FILE_PATH);
    data.remove(id);

    FileService.saveProfileJson(data);
  }
}
