import 'package:assignment16/components/text/text_custom.dart';
import 'package:assignment16/pages/questions_screen.dart';
import 'package:flutter/material.dart';

class StartQuestionScreen extends StatelessWidget {
  const StartQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                TextCustom(
                    text: "Explore",
                    color: Colors.black,
                    weight: FontWeight.w700,
                    fontSize: 42.21),
                TextCustom(
                    text: "Saudi arabia !",
                    color: Color(0xff1C8D21),
                    weight: FontWeight.w700,
                    fontSize: 42.21)
              ],
            ),
            const SizedBox(
              height: 79,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionsScreen()));
              },
              child: Container(
                height: 100,
                width: 305,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.white, Color(0xff1C8D21)])),
                child: const Center(
                  child: TextCustom(
                      text: "Let’s start",
                      color: Colors.black,
                      weight: FontWeight.w700,
                      fontSize: 42.21),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
