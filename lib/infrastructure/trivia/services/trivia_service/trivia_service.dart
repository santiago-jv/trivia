import 'package:flutter/foundation.dart';
import 'package:trivia/infrastructure/trivia/models/trivia_category.dart';
import 'package:trivia/infrastructure/trivia/models/trivia_question_model.dart';
import 'package:trivia/infrastructure/trivia/services/trivia_service/constants/trivia_interfaces.dart';
import '../../config/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TriviaApiService {
  Future<List<TriviaQuestionResult>> getQuestions(QuestionsListParams params);

  Future<List<TriviaCategory>> getCategories();
}

class TriviaApiServiceImpl implements TriviaApiService {
  final Uri apiUrl = triviaBaseUrl;

  @override
  Future<List<TriviaQuestionResult>> getQuestions(
      QuestionsListParams params) async {
    Map<String, dynamic> queryParameters = {
      'amount': params.amount.toString(),
      'difficulty': params.difficulty.name,
      'category': params.category.toString(),
    };

    final apiUrlWithQuestionPath = apiUrl.replace(path: '/api.php');
    final apiUrlWithParameters =
        apiUrlWithQuestionPath.replace(queryParameters: queryParameters);

    final response = await http.get(apiUrlWithParameters);

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final String responseBody = response.body;
      final Map<String, dynamic> responseData = jsonDecode(responseBody);

      final TriviaQuestionResponse triviaQuestionResponse =
          TriviaQuestionResponse.fromJson(responseData);

      final List<TriviaQuestionResult> questions =
          triviaQuestionResponse.results;

      return questions.isEmpty ? [] : questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }

  @override
  Future<List<TriviaCategory>> getCategories() async {
    final apiUrlWithQuestionPath = apiUrl.replace(path: '/api_category.php');

    final response = await http.get(apiUrlWithQuestionPath);

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      final String responseBody = response.body;

      final Map<String, dynamic> responseData = jsonDecode(responseBody);

      final TriviaCategoryResponse triviaCategoryResponse =
          TriviaCategoryResponse.fromJson(responseData);

      final List<TriviaCategory> categories = triviaCategoryResponse.categories;

      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
