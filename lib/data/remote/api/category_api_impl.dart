import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/api/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/enum/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/resources/index.dart';

class CategoryApiImpl extends BaseApi implements CategoryApi {
  @override
  Future<List<CategoryModel>> fetchCategories(
      {required FetchCategoriesParam param}) async {
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['fetch_categories']!
          .appendPath('${param.brokerId}/'),
    ));
    List<CategoryModel> result = [];
    if (json != null && json is List<dynamic>) {
      result =
          json.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
    }

    CategoryModel aboutUs = CategoryModel(
        id: -1,
        name: 'About Us',
        image: AppImages.icBottomBarAboutUs,
        icon: AppImages.icBottomBarAboutUs,
        categoryType: CategoryType.aboutUs);
    result.add(aboutUs);
    return result;
  }

  @override
  Future<List<SubCategoryModel>> fetchSubCategories(
      {required FetchSubCategoriesParam param}) async {
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['fetch_sub_categories_by_category_id']!
          .appendPath('${param.categoryId}/$kBrokerId/'),
    ));
    List<SubCategoryModel> result = [];
    if (json != null && json is List<dynamic>) {
      result = json
          .map<SubCategoryModel>((e) => SubCategoryModel.fromJson(e))
          .toList();
    }
    SubCategoryModel subAll = SubCategoryModel(name: 'All');
    result.insert(0, subAll);

    return result;
  }
}
