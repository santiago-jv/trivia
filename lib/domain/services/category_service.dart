import 'package:trivia/domain/models/category_model.dart';
import 'package:trivia/infrastructure/trivia/services/trivia_service/trivia_service.dart';

abstract class CategoryService {
  Future<List<CategoryModel>> getCategories();
}

class CategoryServiceImpl implements CategoryService {
  late TriviaApiService triviaApiService;

  CategoryServiceImpl() {
    triviaApiService = TriviaApiServiceImpl();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await triviaApiService.getCategories();
    return categories.map((category) => CategoryModel.fromJson(category)).toList();
  }
}
