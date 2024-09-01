import 'package:flutter/material.dart';
import 'package:questions_app/helper/screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  "Explore",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Saudi Arabia!",
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C8D21)),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: context.getWidth(),
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: [Colors.white, Color(0xff1C8D21)],
                      begin: Alignment.centerLeft)),
              child: Text(
                "Let’s start",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
