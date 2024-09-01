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
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  String? _correctAnswer;

  void _checkAnswer(String selected) {
    setState(() {
      _selectedAnswer = selected;
      _correctAnswer = getIt
          .get<QuestionsData>()
          .multipleChoiceQ[_currentQuestionIndex]
          .answer;
    });
  }

  Color _getBorderColor(String option) {
    if (_selectedAnswer == null) return const Color(0xffC9FBB1);
    if (option == _correctAnswer) return const Color(0xff1C8D21);
    if (option == _selectedAnswer) return const Color(0xffF0676F);
    return const Color(0xffC9FBB1);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        getIt.get<QuestionsData>().multipleChoiceQ[_currentQuestionIndex];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              height: 60,
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
                      color: _getBorderColor("A"),
                      onPressed: () =>
                          _selectedAnswer == null ? _checkAnswer("A") : null,
                      title: currentQuestion.a ?? '',
                      numberOfOption: "1"),
                  SelectableButton(
                      color: _getBorderColor("B"),
                      onPressed: () =>
                          _selectedAnswer == null ? _checkAnswer("B") : null,
                      title: currentQuestion.b ?? '',
                      numberOfOption: "2"),
                  SelectableButton(
                      color: _getBorderColor("C"),
                      onPressed: () =>
                          _selectedAnswer == null ? _checkAnswer("C") : null,
                      title: currentQuestion.c ?? '',
                      numberOfOption: "3"),
                  SelectableButton(
                      color: _getBorderColor("D"),
                      onPressed: () =>
                          _selectedAnswer == null ? _checkAnswer("D") : null,
                      title: currentQuestion.d ?? '',
                      numberOfOption: "4")
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_currentQuestionIndex <
                      getIt.get<QuestionsData>().multipleChoiceQ.length - 1) {
                    _currentQuestionIndex++;
                    _selectedAnswer = null;
                    _correctAnswer = null;
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WinnerScreen()));
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
            )
          ],
        ),
      ),
    );
  }
}
