import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:questions_app/data/questios_json.dart';
import 'package:questions_app/data_layer/question_data.dart';
import 'package:questions_app/helper/screen.dart';
import 'package:questions_app/screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  bool isCorrect = false;
  String? selectedAnswer;
  Color wrongAnswer = Colors.red;
  Color correctAsnwer = const Color.fromARGB(255, 1, 255, 9);
  Color defualtColor = Color(0xffC9FBB1);

  void checkAnswer(String answer) {
    selectedAnswer = answer;
    if (answer ==
        GetIt.I.get<QuestionData>().getAllQuestions[currentIndex].answer) {
      isCorrect = true;
      GetIt.I.get<QuestionData>().counter++;
      setState(() {});
    } else {
      isCorrect = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: context.getWidth(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              GetIt.I.get<QuestionData>().getAllQuestions.length > currentIndex
                  ? GetIt.I
                      .get<QuestionData>()
                      .getAllQuestions[currentIndex]
                      .question
                  : "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomAnswer(
                c: defualtColor,
                onTap: () {
                  GetIt.I
                      .get<QuestionData>()
                      .checkAnswer(select: "A", index: currentIndex);
                  print(GetIt.I.get<QuestionData>().counter);
                  GetIt.I.get<QuestionData>().isCorrect == true
                      ? defualtColor = correctAsnwer
                      : defualtColor = wrongAnswer;
                  setState(() {});
                },
                answer:
                    GetIt.I.get<QuestionData>().getAllQuestions[currentIndex].A,
                number: "1"),
            CustomAnswer(
                c: defualtColor,
                onTap: () {
                  GetIt.I
                      .get<QuestionData>()
                      .checkAnswer(select: "B", index: currentIndex);
                  print(GetIt.I.get<QuestionData>().counter);
                  GetIt.I.get<QuestionData>().isCorrect == true
                      ? defualtColor = correctAsnwer
                      : defualtColor = wrongAnswer;
                  setState(() {});
                },
                answer:
                    GetIt.I.get<QuestionData>().getAllQuestions[currentIndex].B,
                number: "2"),
            CustomAnswer(
                c: defualtColor,
                onTap: () {
                  GetIt.I
                      .get<QuestionData>()
                      .checkAnswer(select: "C", index: currentIndex);
                  print(GetIt.I.get<QuestionData>().counter);
                  GetIt.I.get<QuestionData>().isCorrect == true
                      ? defualtColor = correctAsnwer
                      : defualtColor = wrongAnswer;
                  setState(() {});
                },
                answer:
                    GetIt.I.get<QuestionData>().getAllQuestions[currentIndex].C,
                number: "3"),
            CustomAnswer(
                c: defualtColor,
                onTap: () {
                  GetIt.I
                      .get<QuestionData>()
                      .checkAnswer(select: "D", index: currentIndex);
                  print(GetIt.I.get<QuestionData>().counter);
                  GetIt.I.get<QuestionData>().isCorrect == true
                      ? defualtColor = correctAsnwer
                      : defualtColor = wrongAnswer;
                  setState(() {});
                },
                answer:
                    GetIt.I.get<QuestionData>().getAllQuestions[currentIndex].D,
                number: "4"),
            GestureDetector(
              onTap: () {
                if (GetIt.I.get<QuestionData>().getAllQuestions.length - 1 >
                    currentIndex) {
                  GetIt.I.get<QuestionData>().isCorrect = false;
                  defualtColor = Color(0xffC9FBB1);
                  currentIndex++;
                  setState(() {});
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultScreen()),
                  );
                }
              },
              child: Container(
                width: context.getWidth(),
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                        colors: [Colors.white, Color(0xff1C8D21)],
                        begin: Alignment.centerLeft)),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAnswer extends StatelessWidget {
  const CustomAnswer(
      {super.key,
      required this.onTap,
      required this.answer,
      required this.number,
      this.c = const Color(0xffC9FBB1)});
  final Function()? onTap;
  final String answer;
  final String number;
  final Color c;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.getWidth(),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: c, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(answer), Text(number)],
        ),
      ),
    );
  }
}
