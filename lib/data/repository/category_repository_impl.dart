import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/category/category_model.dart';
import 'package:movie_app/domain/model/category/fetch_categories_param.dart';
import 'package:movie_app/domain/model/category/fetch_sub_categories_param.dart';
import 'package:movie_app/domain/model/category/sub_category_model.dart';
import 'package:movie_app/domain/repository/index.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
    this._categoryApi,
  );

  final CategoryApi _categoryApi;

  @override
  Future<List<CategoryModel>> fetchCategories(
      {required FetchCategoriesParam param}) async {
    return (await _categoryApi.fetchCategories(param: param));
  }

  @override
  Future<List<SubCategoryModel>> fetchSubCategories(
      {required FetchSubCategoriesParam param}) async {
    return (await _categoryApi.fetchSubCategories(param: param));
  }
}
