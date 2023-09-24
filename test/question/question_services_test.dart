import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/domain/constants/question_constants.dart';
import 'package:trivia/domain/models/question_model.dart';
import 'package:trivia/domain/services/question_service.dart';
import 'package:trivia/infrastructure/trivia/services/trivia_service/constants/trivia_interfaces.dart';

void main() {
  group('Question Service', () {
    test(
        'Function getQuestions must be return a List of QuestionModel not empty when amount param > 0',
        () async {
      final QuestionService categoryService = QuestionServiceImpl();

      final QuestionsListParams params = QuestionsListParams(
          amount: 3, difficulty: QuestionDifficulty.easy, category: 10);

      final result = await categoryService.getQuestions(params);

      expect(result, isA<List<QuestionModel>>());

      expect(result.isNotEmpty, true);
    });
  });
}
