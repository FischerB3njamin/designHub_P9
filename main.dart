import 'dart:io';
import 'handler/login_handler.dart';
import 'classes/my_profile.dart';
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
          RegistrationHandler().registration();
        case '2':
          LoginHandler().login();
        default:
          print('eingabe ungültig');
      }
    }
  }
}

void startMenu() {
  print('Willkommen melde dich an oder registriere dich');
  print('[1] registrieren');
  print('[2] anmelden');
}

void main() {
  run();
}
