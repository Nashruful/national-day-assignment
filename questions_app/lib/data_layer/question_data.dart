import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:questions_app/data/questios_json.dart';
import 'package:questions_app/model/question_model.dart';

class QuestionData {
  List<QuestionModel> getAllQuestions = [];
  int counter = 0;
  bool isCorrect = false;
  List userAnwers = [];
  final box = GetStorage();
  QuestionData() {
    loadData();
  }

  loadData() {
    for (var element in dataQ) {
      getAllQuestions.add(QuestionModel.fromJson(element));
    }
  }

  checkAnswer({required String select, required int index}) {
    final dataAns = getAllQuestions[index];
    if (select == dataAns.answer) {
      counter++;
      isCorrect = true;
    } else {
      isCorrect = false;
    }
  }

  saveCounter(int counter) {
    box.write("score", counter);
  }

  loadCounter() {
    return box.read("score");
  }
}
