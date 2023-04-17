import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';

enum HiveBoxName { user, bookmark }

enum HiveDBKey { user, bookmark }

extension HiveBoxKeyExtension on HiveBoxName {
  String get name => toString().substring(toString().indexOf('.') + 1);
}

extension HiveDBKeyExtension on HiveDBKey {
  String get name => toString().substring(toString().indexOf('.') + 1);
}

class HiveManager {
  static Future<HiveManager> getInstance() async {
    await Future.forEach<HiveBoxName>(
      HiveBoxName.values,
      (box) async => await Hive.openBox(box.name),
    );

    return HiveManager();
  }

  List<T> getListData<T>(String boxName) => _getListDataFromBox<T>(boxName);

  void addData<T>(String boxName, T valueStore) =>
      _addDataToBox(boxName, valueStore);

  T? getDataWithKey<T>(String boxName, String key) =>
      _getDataWithKeyFromBox(boxName, key);

  void putDataWithKey<T>(String boxName, String key, T valueStore) =>
      _putDataByKeyToBox<T>(boxName, key, valueStore);

  List<T> _getListDataFromBox<T>(String boxName) {
    final box = Hive.box(boxName);

    return box.isNotEmpty ? box.values.map<T>((value) => value).toList() : [];
  }

  void _addDataToBox<T>(String boxName, T valueStore) {
    final box = Hive.box(boxName);

    /// Because we can't sort value already contain in list to first, so we delete old value and add new to list
    final List<T> listStoredData = _getListDataFromBox(boxName);
    final indexInList = listStoredData.indexWhere((data) => data == valueStore);
    if (indexInList != -1) {
      box.deleteAt(indexInList);
    }

    box.add(valueStore);
  }

  T? _getDataWithKeyFromBox<T>(String boxName, String key) {
    final box = Hive.box(boxName);
    if (box.get(key) != null) {
      return box.get(key);
    }

    return null;
  }

  void _putDataByKeyToBox<T>(String boxName, String key, T valueStore) {
    final box = Hive.box(boxName);
    box.put(key, valueStore);
  }
}
