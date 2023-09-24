import 'package:trivia/domain/constants/question_constants.dart';
import 'package:trivia/infrastructure/trivia/models/trivia_question_model.dart';

class QuestionModel {
  final String category;
  final QuestionType type;
  final QuestionDifficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuestionModel({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  static QuestionType _convertStringToQuestionType(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'multiple':
        return QuestionType.multiple;
      case 'boolean':
        return QuestionType.boolean;
      default:
        throw ArgumentError('Tipo de pregunta desconocido: $typeString');
    }
  }

  static QuestionDifficulty _convertStringToQuestionDifficulty(String difficultyString) {
    switch (difficultyString.toLowerCase()) {
      case 'easy':
        return QuestionDifficulty.easy;
      case 'medium':
        return QuestionDifficulty.medium;
      case 'hard':
        return QuestionDifficulty.hard;
      default:
        throw ArgumentError('Nivel de dificultad desconocido: $difficultyString');
    }
  }

  factory QuestionModel.fromJson(TriviaQuestionResult questionResult) {
    final type = _convertStringToQuestionType(questionResult.type);
    final difficulty =
        _convertStringToQuestionDifficulty(questionResult.difficulty);

    return QuestionModel(
      category: questionResult.category,
      type: type,
      difficulty: difficulty,
      question: questionResult.question,
      correctAnswer: questionResult.correctAnswer,
      incorrectAnswers:
          List<String>.from(questionResult.incorrectAnswers.map((x) => x)),
    );
  }
}
