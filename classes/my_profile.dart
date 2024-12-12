import 'dart:io';
import '../service/profile_service.dart';
import '../service/registration_service.dart';
import 'utils.dart';

class MyProfile {
  static MyProfile? _instance = MyProfile._internal();
  String name = "";
  String job = "";
  String city = "";
  String id = "";
  bool loggedIn = false;

  MyProfile._internal();

  factory MyProfile() {
    _instance ??= MyProfile._internal();
    return _instance!;
  }

  bool setProfile(String mail, String password) {
    String id = RegistrationService.getIdFromLogin(mail, password);
    return _updateProfile(id);
  }

  bool setProfileById(String id) {
    return _updateProfile(id);
  }

  bool reloadProfile() {
    return _updateProfile(this.id);
  }

  bool _updateProfile(String id) {
    Map profile = ProfileService.loadProfile(id);
    if (profile.isNotEmpty) {
      this.name = profile['name'];
      this.city = profile['city'];
      this.job = profile['job'];
      this.id = id;
      this.loggedIn = true;
      return true;
    }
    return false;
  }

  bool createProfile(String mail, String password) {
    Utils.clearConsole();
    print('Legen wir ein neues Profil für dich an:');

    String name = insertData("Bitte gebe deinen Namen ein:");
    String city = insertData("Bitte gebe deine Stadt ein:");
    String job = insertData("Bitte gebe deinen Job ein:");
    String id = RegistrationService.getIdFromLogin(mail, password);

    ProfileService.saveProfile({"name": name, 'city': city, 'job': job}, id);

    return _updateProfile(id);
  }

  void logout() {
    _instance = null;
  }

  String insertData(String text) {
    print(text);
    return stdin.readLineSync() ?? '';
  }

  void showProfile() {
    Utils.clearConsole();
    print("Dein Profil enthält folgende Werte:");
    print("Name: $name");
    print("Stadt: $city");
    print("Job: $job");
  }

  void updateName() {
    print('gebe deinen neuen Namen ein:');
    update(this.id, 'name');
  }

  void updateJob() {
    print('gebe deinen neuen Job ein:');
    update(this.id, 'job');
  }

  void updateCity() {
    print('gebe deinen neue Stadt ein:');
    update(this.id, 'city');
  }

  void update(id, key) {
    String input = stdin.readLineSync() ?? '';
    ProfileService.updateProfile(id, key, input);
  }

  void deleteProfile() {
    ProfileService.deleteProfile(this.id);
    RegistrationService.deleteLogin(this.id);
  }
}
