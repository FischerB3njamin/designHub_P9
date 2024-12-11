import 'dart:io';
import 'login_handler.dart';
import 'menues.dart';
import 'my_profile.dart';
import 'profile_handler.dart';
import 'registration_handler.dart';

void run() {
  while (true) {
    print(MyProfile().loggedIn);
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
