import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('box');
  }

  Future<void> save(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<dynamic> get(String key) async {
    return _box.get(key);
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> close() async {
    await _box.close();
    await Hive.close();
  }
}
