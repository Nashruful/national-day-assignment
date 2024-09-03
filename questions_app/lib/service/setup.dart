import 'package:get_it/get_it.dart';
import 'package:questions_app/data_layer/question_data.dart';

void setup() {
// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<QuestionData>(QuestionData());
}
