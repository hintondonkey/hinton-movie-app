import 'package:movie_app/domain/model/index.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> fetchCategories({required FetchCategoriesParam param});

  Future<List<SubCategoryModel>> fetchSubCategories({required FetchSubCategoriesParam param});


}