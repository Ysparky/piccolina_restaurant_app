import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs()
    ..initPrefs();
  setupInjection();
  runApp(const MyApp());
}
