class TriviaCategoryResponse {
  final List<TriviaCategory> categories;

  TriviaCategoryResponse({
    required this.categories,
  });

  factory TriviaCategoryResponse.fromJson(Map<String, dynamic> json) {
    return TriviaCategoryResponse(
      categories: List<TriviaCategory>.from(
          json['trivia_categories'].map((x) => TriviaCategory.fromJson(x))),
    );
  }

}

class TriviaCategory {
  final int id;
  final String name;

  TriviaCategory({
    required this.id,
    required this.name,
  });

  factory TriviaCategory.fromJson(Map<String, dynamic> json) {
    return TriviaCategory(
      id: json['id'],
      name: json['name'],
    );
  }

}