import 'package:assignment16/pages/start_question_screen.dart';
import 'package:assignment16/setup/init.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)),
      home: const StartQuestionScreen(),
    );
  }
}
