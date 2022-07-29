import 'package:flutter/material.dart';
import 'package:weight_tracker/app.dart';
import 'package:weight_tracker/features/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
