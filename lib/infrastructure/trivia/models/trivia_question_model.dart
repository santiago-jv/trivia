class TriviaQuestionResponse {
  final int responseCode;
  final List<TriviaQuestionResult> results;

  TriviaQuestionResponse({
    required this.responseCode,
    required this.results,
  });

  factory TriviaQuestionResponse.fromJson(Map<String, dynamic> json) {
    return TriviaQuestionResponse(
      responseCode: json['response_code'],
      results: List<TriviaQuestionResult>.from(
          json['results'].map((x) => TriviaQuestionResult.fromJson(x))),
    );
  }
}

class TriviaQuestionResult {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  TriviaQuestionResult({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory TriviaQuestionResult.fromJson(Map<String, dynamic> json) {
    return TriviaQuestionResult(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers:
          List<String>.from(json['incorrect_answers'].map((x) => x)),
    );
  }
}
