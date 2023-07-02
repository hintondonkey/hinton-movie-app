import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/stream/fetch_stream_by_id.dart';
import 'package:movie_app/domain/model/stream/fetch_stream_by_sub_category_param.dart';
import 'package:movie_app/domain/model/stream/stream_model.dart';
import 'package:movie_app/domain/repository/index.dart';

class StreamRepositoryImpl implements StreamRepository {
  final StreamApi _streamApi;

  StreamRepositoryImpl(
    this._streamApi,
  );

  @override
  Future<List<StreamModel>> fetchStreamBySubCategory(
      {required FetchStreamBySubCategoryParam param}) async {
    return (await _streamApi.fetchStreamBySubCategory(param: param));
  }

  @override
  Future<StreamModel> fetchStreamById({required FetchStreamByIdParam param}) async {
    return (await _streamApi.fetchStreamById(param: param));
  }
}
