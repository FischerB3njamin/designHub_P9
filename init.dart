import 'dart:io';

import 'login.dart';
import 'menues.dart';
import 'registration.dart';

void run() {
  while (true) {
    startMenu();
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        registration();
      case '2':
        login();
      default:
        print('eingabe ungültig');
    }
  }
}
