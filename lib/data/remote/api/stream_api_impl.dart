import 'package:movie_app/data/net/index.dart';
import 'package:movie_app/data/remote/base/index.dart';
import 'package:movie_app/domain/model/stream/fetch_stream_by_sub_category_param.dart';
import 'package:movie_app/domain/model/stream/stream_model.dart';

class StreamApiImpl extends BaseApi implements StreamApi {
  @override
  Future<List<StreamModel>> fetchStreamBySubCategory(
      {required FetchStreamBySubCategoryParam param}) async {
    // final connection = await initConnection();
    // var url = endPointProvider!.endpoints['fetch_stream_platform_movie']!
    //     .appendPath('${param.brokerId}/${param.categoryId}');
    // if (param.subCategoryId != null) {
    //   url = url.appendPath('/${param.subCategoryId}');
    // }
    // final json = await connection.execute(ApiInput(
    //   url,
    // ));

    final x = [
      {
        "id": 0,
        "watchlist": [
          {
            "id": 0,
            "date_picker": "2023-06-30",
            "time_show_date": "string",
            "price": 2147483647,
            "website": "https://google.com",
            "active": true,
            "create_date": "2023-06-30T05:58:43.820Z",
            "platform": 0
          }
        ],
        "stream_flatform_image": [
          {
            "id": 0,
            "uid": "string",
            "name": "string",
            "description": "string",
            "file": "https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg",
            "event": 0
          }
        ],
        "category_name": "string",
        "subcategory_name": "string",
        "title": "WHERE THE CRAWDADS SING",
        "description": "string",
        "sub_icon": "string",
        "uid_sub_icon": "string",
        "show_date": "2023-06-30",
        "time_show_date": "string",
        "close_date": "2023-06-30",
        "time_close_date": "string",
        "post_date": "2023-06-30",
        "post_time": "string",
        "close_post_date": "2023-06-30",
        "close_post_time": "string",
        "active": true,
        "create_date": "2023-06-30",
        "titleNoti": "string",
        "summaryNoti": "string",
        "number_of_connection": 2147483647,
        "approval": "string",
        "status": true,
        "is_horizontal": true,
        "category": 0,
        "subcategory": 0,
        "broker": 0,
        "created_user": "Hinton Donkey"
      }
    ];
    List<StreamModel> results = [];
    results = x.map<StreamModel>((e) => StreamModel.fromJson(e)).toList();
    await Future.delayed(const Duration(seconds: 3), () {});
    // if (json != null && json is List<dynamic>) {
    //   results = json.map<StreamModel>((e) => StreamModel.fromJson(e)).toList();
    // }
    return results;
  }
}
