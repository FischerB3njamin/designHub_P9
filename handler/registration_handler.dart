import 'dart:io';
import '../my_profile.dart';
import '../service/registration_service.dart';
import '../utils.dart';

class RegistrationHandler {
  RegistrationData data = RegistrationData('', '');

  void registration() {
    _setMail();
    _setPassword();
    RegistrationService.saveLogin(this.data.toMap());
    // create an empty profile

    MyProfile().createProfile(this.data.mail, this.data.password);
  }

  void _setMail() {
    print('Bitte gebe deine Mail-Adresse ein:');
    String mail = stdin.readLineSync()!;

    if (mail.isNotEmpty && mail.contains('@')) {
      this.data.mail = mail;
      return;
    }

    print('Mail darf nicht leer sein und muss ein @ enthalten!');
    _setMail();
  }

  void _setPassword() {
    String pwd = Utils.hiddenInput('Bitte gebe dein Passwort ein:');
    String repeatedPwd = Utils.hiddenInput('wiederhole dein Passwort');

    if (pwd.trim().isNotEmpty &&
        repeatedPwd.trim().isNotEmpty &&
        pwd == repeatedPwd) {
      this.data.password = pwd;
      return;
    }

    print('Die Passwörter stimmen nicht überein. Bitte versuche es erneut');
    _setPassword();
  }
}

class RegistrationData {
  String mail;
  String password;
  String id = "DH-${DateTime.now().millisecondsSinceEpoch}";

  RegistrationData(this.mail, this.password) {}

  Map toMap() {
    return {"mail": mail, "password": password, "id": id};
  }
}
