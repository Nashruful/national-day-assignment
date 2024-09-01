import 'package:assignment16/data_layer/questions_data.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup()async{
  await GetStorage.init();
   getIt.registerSingleton<QuestionsData>(QuestionsData());

}