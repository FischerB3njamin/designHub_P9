import 'dart:io';
import 'handler/login_handler.dart';
import 'menues.dart';
import 'my_profile.dart';
import 'handler/profile_handler.dart';
import 'handler/registration_handler.dart';

void run() {
  while (true) {
    if (MyProfile().loggedIn) {
      ProfileHandler().handleProfile();
    } else {
      startMenu();
      String? input = stdin.readLineSync();

      switch (input) {
        case '1':
          print("reg");
          RegistrationHandler().registration();
        case '2':
          print('login');
          LoginHandler().login();
        default:
          print('eingabe ungültig');
      }
    }
  }
}

void main() {
  run();
}
