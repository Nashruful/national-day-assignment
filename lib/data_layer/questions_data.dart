import 'package:assignment16/data/data_json.dart';
import 'package:assignment16/models/question_models.dart';
import 'package:get_storage/get_storage.dart';

class QuestionsData {
  List<QuestionModels> multipleChoiceQ =
      dataQ.map((e) => QuestionModels.fromJson(e)).toList();
  final box = GetStorage();
  int score = 0;
  int currentQuestionIndex = 0;

  QuestionsData() {
    loadData();
  }

  loadData() {
    if (box.hasData("currentQuestion")) {
      currentQuestionIndex = box.read("currentQuestion");
      score = box.read("score");
    }
  }

  resetData() {
    box.remove("currentQuestion");
  }

  currentScore(){
    box.write("score", score);
  }

  nextQuestion() {
    box.write("currentQuestion", currentQuestionIndex);
  }
}
