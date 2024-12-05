import 'dart:io';
import 'dart:convert';

void clearConsole() {
  if (Platform.isWindows) {
    print(Process.runSync('cls', [], runInShell: true).stdout);
  } else {
    print(Process.runSync('clear', [], runInShell: true).stdout);
  }
}

String encryptPassword(String pwd) {
  return base64Encode(utf8.encode(pwd));
}

String hiddenInput(String output) {
  print("$output");
  stdin.echoMode = false;
  String result = stdin.readLineSync() ?? '';
  stdin.echoMode = true;
  return result;
}
