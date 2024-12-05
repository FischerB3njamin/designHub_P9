import 'dart:io';
import 'helper.dart';
import 'profile.dart';

bool login() {
  while (true) {
    print('Bitte gebe deine Email-Adresse ein: ');
    String mail = stdin.readLineSync() ?? '';
    String pwd = hiddenInput('Bitte gebe dein Passwort ein: ');

    Map data = loadLogin();

    if (data.keys.contains(mail) &&
        data[mail]['password'] == encryptPassword(pwd)) {
      clearConsole();
      print('login successfull');
      //set profile and so on
      handleProfile(mail, data[mail]['id']);
    } else {
      print('wrong mail or password');
    }
    //check if login is valid
  }
}
