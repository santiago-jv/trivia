import 'package:trivia/infrastructure/trivia/models/trivia_category.dart';

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(TriviaCategory category) => CategoryModel(
        id: category.id,
        name: category.name,
      );
}
