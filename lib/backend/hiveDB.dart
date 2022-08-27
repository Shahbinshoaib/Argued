import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDB {
  static get init async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Future<int> add(String boxName, data) async {
    var box = await Hive.openBox(boxName);
    int id = await box.add(data);
    close(boxName);
    return id;
  }

  update(String boxName, Map<String, dynamic> data, int id) async {
    var box = Hive.box(boxName);
    box.put(id, data);
    close(boxName);
  }

  Future get(String boxName, int id) async {
    var box = await Hive.openBox(boxName);
    var data = await box.get(id);
    return data;
  }

  deleteLogs(String boxName, int id) async {
    // var box = Hive.box(boxName);
    // await box.deleteAt(logId);
    // await box.delete(logId);
  }

  close(String boxName) {
    Hive.box(boxName).close();
  }
}
