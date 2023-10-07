import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/domain/models/category_model.dart';
import 'package:trivia/domain/services/category_service.dart';

void main() {
  group('Category Service', () {
    test(
        'Function getCategories must be return a List of CategoryModel not empty',
        () async {
      final CategoryService categoryService = CategoryServiceImpl();

      final result = await categoryService.getCategories();

      expect(result, isA<List<CategoryModel>>());

      expect(result.isNotEmpty, true);
    });
  });
}
