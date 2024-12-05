import 'dart:io';
import 'helper.dart';
import 'profile.dart';
import 'service/registration_service.dart';

bool registration() {
  while (true) {
    print('Bitte gebe deine Mail-Adresse ein:');
    String mail = stdin.readLineSync() ?? '';
    String pwd = hiddenInput('Bitte gebe dein Passwort ein:');
    String repeatedPwd = hiddenInput('wiederhole dein Passwort');

    if (mail.isNotEmpty && pwd.isNotEmpty && repeatedPwd.isNotEmpty) {
      if (pwd == repeatedPwd) {
        saveLogin({'mail': mail, 'password': encryptPassword(pwd)});
        handleProfile('', mail);
      } else {
        print('Passwörter stimmen nicht überein');
      }
    } else {
      print('Die Eingaben dürfen nicht leer sein! Try again!');
    }
  }
}
