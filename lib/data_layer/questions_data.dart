import 'package:assignment16/data/data_json.dart';
import 'package:assignment16/models/question_models.dart';
import 'package:get_storage/get_storage.dart';

class QuestionsData {
  List<QuestionModels> multipleChoiceQ =
      dataQ.map((e) => QuestionModels.fromJson(e)).toList();
  final box = GetStorage();

  checkAnswer() {}
}
