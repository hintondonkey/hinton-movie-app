import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/enum/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/resources/index.dart';

class CategoryApiImpl extends BaseApi implements CategoryApi {
  @override
  Future<List<CategoryModel>> fetchCategories(
      {required FetchCategoriesParam param}) async {
    // final connection = await initConnection();
    // final json = await connection.execute(ApiInput(
    //   endPointProvider!.endpoints['fetch_categories']!
    //       .appendPath('${param.brokerId}'),
    // ));
    List<CategoryModel> result = [];
    // if (json != null && json is List<dynamic>) {
    //   result =
    //       json.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
    // }
    CategoryModel event = CategoryModel(
        id: -1,
        name: 'Event',
        image: AppImages.icBottomBarEvent,
        categoryType: CategoryType.event);
    CategoryModel aboutUs = CategoryModel(
        id: -2,
        name: 'About Us',
        image: AppImages.icBottomBarAboutUs,
        categoryType: CategoryType.aboutUs);
    result.add(event);
    result.add(aboutUs);
    return result;
  }

  @override
  Future<List<SubCategoryModel>> fetchSubCategories(
      {required FetchSubCategoriesParam param}) async {
    // final connection = await initConnection();
    // final json = await connection.execute(ApiInput(
    //   endPointProvider!.endpoints['fetch_sub_categories']!
    //       .appendPath('${param.categoryId}'),
    // ));
    List<SubCategoryModel> result = [];

    SubCategoryModel sub1 = SubCategoryModel(id: 0, name: 'All');
    SubCategoryModel sub2 = SubCategoryModel(id: 1, name: 'Movie');
    SubCategoryModel sub3 = SubCategoryModel(id: 2, name: 'Ronaldo');
    SubCategoryModel sub4 = SubCategoryModel(id: 3, name: 'Messi');
    SubCategoryModel sub5 = SubCategoryModel(id: 4, name: 'London');
    SubCategoryModel sub6 = SubCategoryModel(id: 5, name: 'VietNam');
    SubCategoryModel sub7 = SubCategoryModel(id: 6, name: 'TQ');

    result.add(sub1);
    result.add(sub2);
    result.add(sub3);
    result.add(sub4);
    result.add(sub5);
    result.add(sub6);
    result.add(sub7);
    // if (json != null && json is List<dynamic>) {
    //   result = json
    //       .map<SubCategoryModel>((e) => SubCategoryModel.fromJson(e))
    //       .toList();
    // }
    return result;
  }
}
