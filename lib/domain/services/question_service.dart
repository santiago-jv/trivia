import 'package:trivia/domain/models/question_model.dart';
import 'package:trivia/infrastructure/trivia/services/trivia_service/constants/trivia_params.dart';
import 'package:trivia/infrastructure/trivia/services/trivia_service/trivia_service.dart';

abstract class QuestionService {
  Future<List<QuestionModel>> getQuestions(QuestionsListParams params);
}

class QuestionServiceImpl implements QuestionService {
  late TriviaApiService triviaApiService;

  QuestionServiceImpl() {
    triviaApiService = TriviaApiServiceImpl();
  }

  @override
  Future<List<QuestionModel>> getQuestions(QuestionsListParams params) async {
    final questions = await triviaApiService.getQuestions(params);
    return questions.map((question) => QuestionModel.fromJson(question)).toList();
  }
}
