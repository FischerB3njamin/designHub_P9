import 'file_service.dart';

class RegistrationService {
  static void saveLogin(Map _data) {
    List data = FileService.loadLoginJson();
    data.add(_data);
    FileService.saveJson(data);
  }

  static void deleteLogin(String id) {
    List data = FileService.loadLoginJson();
    List withoutProfile = [];
    for (Map x in data) {
      if (x['id'] != id) {
        withoutProfile.add(x);
      }
    }
    FileService.saveJson(withoutProfile);
  }

  static getIdFromLogin(String mail, String password) {
    List logindata = FileService.loadLoginJson();

    for (Map x in logindata) {
      if (x['mail'] == mail && x['password'] == password) {
        return x['id'];
      }
    }

    return '';
  }
}
