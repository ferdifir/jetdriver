import 'package:flutter/material.dart';
import 'package:jetdriver/app.dart';
import 'package:jetdriver/service/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(const JetApp());
}