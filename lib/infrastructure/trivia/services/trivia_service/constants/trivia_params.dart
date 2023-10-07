import 'package:trivia/domain/constants/question_constants.dart';

class QuestionsListParams {
  final int amount;
  final QuestionDifficulty difficulty;
  final int categoryId;

  QuestionsListParams({
    required this.amount,
    required this.difficulty,
    required this.categoryId,
  });
}