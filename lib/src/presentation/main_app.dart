import 'package:flutter/material.dart';
import 'package:v/src/presentation/pages/controller_method_server_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const ControllerMethodServerPage(),
    );
  }
}
