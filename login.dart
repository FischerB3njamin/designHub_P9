import 'dart:io';
import 'helper.dart';
import 'profile.dart';
import 'service/registration_service.dart';

void login() {
  while (true) {
    print('Bitte gebe deine Email-Adresse ein: ');
    String mail = stdin.readLineSync() ?? '';
    String pwd = hiddenInput('Bitte gebe dein Passwort ein: ');

    Map data = loadLoginJson();

    if (data.keys.contains(mail) &&
        data[mail]['password'] == encryptPassword(pwd)) {
      clearConsole();
      handleProfile(data[mail]['id'], mail);
    } else {
      print('wrong mail or password');
    }
  }
}
