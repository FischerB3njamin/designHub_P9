import 'dart:io';
import '../my_profile.dart';
import '../utils.dart';

class LoginHandler {
  String mail = "";
  String password = "";

  void login() {
    _getMail();
    _getPassword();

    if (MyProfile().setProfile(this.mail, this.password)) {
      return;
    }
    print('Email oder Passwort stimmen nicht. Versuche es erneut!');
    login();
  }

  void _getMail() {
    print('Bitte gebe deine Email-Adresse ein: ');
    final String inputMail = stdin.readLineSync() ?? '';

    if (inputMail.isNotEmpty && inputMail.contains('@')) {
      this.mail = inputMail;
      return;
    }
    print('Mail darf nicht leer sein und muss ein @ enthalten!');
    _getMail();
  }

  void _getPassword() {
    String pwd = Utils.hiddenInput('Bitte gebe dein Passwort ein: ');
    if (pwd.isNotEmpty) {
      this.password = pwd;
      return;
    }
  }
}
