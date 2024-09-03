import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:questions_app/data_layer/question_data.dart';
import 'package:questions_app/helper/screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset("assets/animation/a1.json"),
          Positioned(
              top: 150,
              left: 120,
              child: Image.asset(
                "assets/images/icon1.png",
                width: 200,
                height: 200,
              )),
          SizedBox(
            width: context.getWidth(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Congraulation!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your result is :${GetIt.I.get<QuestionData>().loadCounter()} / ${GetIt.I.get<QuestionData>().getAllQuestions.length + 1}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: context.getWidth(),
                  child: Image.asset(
                    "assets/images/image1.png",
                    fit: BoxFit.cover,
                  ))
            ],
          )
        ],
      ),
    );
    ;
  }
}
