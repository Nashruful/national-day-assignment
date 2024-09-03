import 'package:flutter/material.dart';
import 'package:questions_app/screen/home_screen.dart';
import 'package:questions_app/service/setup.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
