import 'package:movie_app/domain/model/index.dart';

abstract class StreamRepository {
  Future<List<StreamModel>> fetchStreamBySubCategory({required FetchStreamBySubCategoryParam param});
}