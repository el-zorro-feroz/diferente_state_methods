import 'package:flutter/material.dart';
import 'package:v/core/services/services.dart';
import 'package:v/src/presentation/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MainApp());
}
