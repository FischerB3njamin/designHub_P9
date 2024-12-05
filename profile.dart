import 'dart:io';
import 'helper.dart';

import 'main.dart';
import 'menues.dart';
import 'service/profile_service.dart';
import 'service/registration_service.dart';

void handleProfile(String id, String mail) {
  Map profile = {};
  while (true) {
    if (id.isEmpty) {
      id = createProfile();
      updateLoginWithId(mail, id);
      profile = loadProfileById(id);
    } else {
      profile = loadProfileById(id);
      print("Willkommen zurück ${profile['name']}");
      profileMenue();
      String input = stdin.readLineSync() ?? '';
      if (input.isNotEmpty) {
        switch (input) {
          case '1':
            showProfile(profile);
          case '2':
            profile = updateProfile(id);
          case '3':
            deleteProfile(id, mail);
            run();
          case '4':
            clearConsole();
            print('bitte logge dich ein');
            return;
        }
      }
    }
    clearConsole();
  }
}

String createProfile() {
  clearConsole();
  print('Legen wir ein neues Profil für dich an:');
  print("gebe deinen Namen ein:");
  String name = stdin.readLineSync() ?? '';
  print('gebe deine Stadt ein');
  String city = stdin.readLineSync() ?? '';
  print('gebe deinen job ein');
  String job = stdin.readLineSync() ?? '';

  Map data = {"name": name, 'city': city, 'job': job};
  String id = "${DateTime.now().millisecondsSinceEpoch}";

  saveNewProfile(data, id);

  return id;
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

Map updateProfile(String id) {
  while (true) {
    clearConsole();
    editProfileMenu();
    String input = stdin.readLineSync() ?? '';

    switch (input) {
      case '1':
        updateName(id);
      case '2':
        updateJob(id);
      case '3':
        updateCity(id);
      case '4':
        return loadProfileById(id);
    }
  }
}

void updateName(String id) {
  print('gebe deinen neuen Namen ein:');
  update(id, 'name');
}

void updateJob(String id) {
  print('gebe deinen neuen Job ein:');
  update(id, 'job');
}

void updateCity(String id) {
  print('gebe deinen neue Stadt ein:');
  update(id, 'city');
}

void update(id, key) {
  String input = stdin.readLineSync() ?? '';
  updateProfileJson(id, key, input);
}

void deleteProfile(String id, String mail) {
  deleteProfileById(id);
  deleteLogin(mail);
}
