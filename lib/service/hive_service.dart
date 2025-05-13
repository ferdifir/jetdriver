import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;

  HiveService._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('appBox');
  }

  Box get _box => Hive.box('appBox');

  // Simpan data
  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  // Ambil data
  T? get<T>(String key) {
    return _box.get(key);
  }

  // Hapus data
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  // Cek apakah key tersedia
  bool contains(String key) {
    return _box.containsKey(key);
  }

  // Clear semua data
  Future<void> clear() async {
    await _box.clear();
  }
}
