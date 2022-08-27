import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class LocalFiles {

  static Future<File> _localFile(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$name');
  }

  static Future<String> readFile(String name) async {
    try {
      final file = await _localFile(name);
      String content = await file.readAsString();
      return content;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<File> writeFile(String name, String contents) async {
    try {
      final file = await _localFile(name);
      return await file.writeAsString(contents);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
