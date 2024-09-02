import 'package:assignment16/components/buttons/selectable_button.dart';
import 'package:assignment16/components/text/text_custom.dart';
import 'package:assignment16/data_layer/questions_data.dart';
import 'package:assignment16/pages/winner_screen.dart';
import 'package:assignment16/setup/init.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  String? selectedAnswer;
  String? correctAnswer;
  bool isLocked = true;

  void checkAnswer(String selected) {
    setState(() {
      isLocked = false;
      selectedAnswer = selected;
      correctAnswer = getIt
          .get<QuestionsData>()
          .multipleChoiceQ[getIt.get<QuestionsData>().currentQuestionIndex]
          .answer;
      if (selectedAnswer == correctAnswer) {
        getIt.get<QuestionsData>().score++;
      }
    });
  }

  Color getSelectedColor(String option) {
    if (option == selectedAnswer) {
      if (selectedAnswer == correctAnswer) {
        return const Color(0xff1C8D21);
      } else {
        return const Color(0xffF0676F);
      }
    } else {
      return const Color(0xffC9FBB1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = getIt
        .get<QuestionsData>()
        .multipleChoiceQ[getIt.get<QuestionsData>().currentQuestionIndex];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 320,
              child: TextCustom(
                text: currentQuestion.question!,
                color: Colors.black,
                weight: FontWeight.w700,
                fontSize: 23.01,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectableButton(
                      color: getSelectedColor("A"),
                      onPressed: () =>
                          selectedAnswer == null ? checkAnswer("A") : null,
                      title: currentQuestion.a ?? '',
                      numberOfOption: "1"),
                  SelectableButton(
                      color: getSelectedColor("B"),
                      onPressed: () =>
                          selectedAnswer == null ? checkAnswer("B") : null,
                      title: currentQuestion.b ?? '',
                      numberOfOption: "2"),
                  SelectableButton(
                      color: getSelectedColor("C"),
                      onPressed: () =>
                          selectedAnswer == null ? checkAnswer("C") : null,
                      title: currentQuestion.c ?? '',
                      numberOfOption: "3"),
                  SelectableButton(
                      color: getSelectedColor("D"),
                      onPressed: () =>
                          selectedAnswer == null ? checkAnswer("D") : null,
                      title: currentQuestion.d ?? '',
                      numberOfOption: "4")
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                isLocked
                    ? null
                    : setState(() {
                        if (getIt.get<QuestionsData>().currentQuestionIndex <
                            getIt.get<QuestionsData>().multipleChoiceQ.length -
                                1) {
                          getIt.get<QuestionsData>().currentQuestionIndex++;
                          getIt.get<QuestionsData>().nextQuestion();
                          getIt.get<QuestionsData>().currentScore();
                          selectedAnswer = null;
                          correctAnswer = null;
                          isLocked = true;
                        } else {
                          getIt.get<QuestionsData>().resetData();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WinnerScreen(
                                        score: getIt.get<QuestionsData>().score,
                                      )));
                        }
                      });
              },
              child: Container(
                height: 81.44,
                width: 201,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.33),
                    color: const Color(0xff1C8D21)),
                child: const Center(
                  child: TextCustom(
                      text: "Continue",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 22.53),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
