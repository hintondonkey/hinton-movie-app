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
}
