import 'dart:io';
import 'dart:convert';

class Utils {
  static void clearConsole() {
    if (Platform.isWindows) {
      print(Process.runSync('cls', [], runInShell: true).stdout);
    } else {
      print(Process.runSync('clear', [], runInShell: true).stdout);
    }
  }

  static String encryptPassword(String pwd) {
    return base64Encode(utf8.encode(pwd));
  }

  static String hiddenInput(String output) {
    print("$output");
    stdin.echoMode = false;
    String result = stdin.readLineSync() ?? '';
    stdin.echoMode = true;
    return result;
  }
}
