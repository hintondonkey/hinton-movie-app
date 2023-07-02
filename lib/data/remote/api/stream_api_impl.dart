import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/stream/fetch_stream_by_id.dart';
import 'package:movie_app/domain/model/stream/fetch_stream_by_sub_category_param.dart';
import 'package:movie_app/domain/model/stream/stream_model.dart';

class StreamApiImpl extends BaseApi implements StreamApi {
  @override
  Future<List<StreamModel>> fetchStreamBySubCategory(
      {required FetchStreamBySubCategoryParam param}) async {
    final connection = await initConnection();
    var url = endPointProvider!.endpoints['fetch_stream_platform_movie']!
        .appendPath('${param.brokerId}/${param.categoryId}/');
    if (param.subCategoryId != null && param.subCategoryId != -1) {
      url = url.appendPath('/${param.subCategoryId}/');
    }
    final json = await connection.execute(ApiInput(
      url,
    ));

    List<StreamModel> results = [];

    if (json != null && json is List<dynamic>) {
      results = json.map<StreamModel>((e) => StreamModel.fromJson(e)).toList();
    }
    return results;
  }

  @override
  Future<StreamModel> fetchStreamById(
      {required FetchStreamByIdParam param}) async {
    final connection = await initConnection();
    final json = await connection.execute(ApiInput(
      endPointProvider!.endpoints['fetch_stream_movie_detail']!
          .appendPath('${param.streamId}/'),
    ));
    StreamModel model = StreamModel.fromJson(json);
    return model;
  }
}
