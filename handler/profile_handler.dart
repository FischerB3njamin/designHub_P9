import 'dart:io';
import '../main.dart';
import '../classes/utils.dart';
import '../classes/my_profile.dart';

class ProfileHandler {
  void handleProfile() {
    while (true) {
      print("Willkommen zurück ${MyProfile().name}");
      profileMenue();
      String input = stdin.readLineSync() ?? '';
      if (input.isNotEmpty) {
        switch (input) {
          case '1':
            MyProfile().showProfile();
          case '2':
            updateProfile();
          case '3':
            MyProfile().deleteProfile();
            MyProfile().logout();
            run();
          case '4':
            MyProfile().logout();
            Utils.clearConsole();
            print('bitte logge dich ein');
            return;
        }
      }
    }
  }

  void showProfile(Map profile) {
    print("Profilübersicht:");
    print("Name: ${profile['name']}");
    print("Stadt: ${profile['city']}");
    print("Job: ${profile['job']}");
    print('drücke enter für weiter');
    // wait until user press enter to clear the window
    stdin.readLineSync();
  }

  bool updateProfile() {
    while (true) {
      Utils.clearConsole();
      editProfileMenu();
      String input = stdin.readLineSync() ?? '';

      switch (input) {
        case '1':
          MyProfile().updateName();
        case '2':
          MyProfile().updateJob();
        case '3':
          MyProfile().updateCity();
        case '4':
          return MyProfile().reloadProfile();
      }
    }
  }

  void editProfileMenu() {
    print('[1] Name ändern');
    print('[2] Job ändern');
    print('[3] Stadt ändern');
    print('[4] zurück');
  }

  void profileMenue() {
    print('[1] zeige Profil');
    print('[2] Profil bearbeiten');
    print('[3] Profil löschen');
    print('[4] auslogen');
  }
}
