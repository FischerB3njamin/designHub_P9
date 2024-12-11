import 'dart:io';
import 'main.dart';
import 'utils.dart';
import 'menues.dart';
import 'my_profile.dart';

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
}
