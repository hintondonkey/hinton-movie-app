import 'package:movie_app/domain/model/index.dart';

class StreamModel {
  int? id;
  List<WatchModel>? watchlist;
  List<StreamFlatformImage>? streamFlatformImage;
  String? categoryName;
  String? subcategoryName;
  String? title;
  String? description;
  String? subIcon;
  String? uidSubIcon;
  String? showDate;
  String? timeShowDate;
  String? closeDate;
  String? timeCloseDate;
  String? postDate;
  String? postTime;
  String? closePostDate;
  String? closePostTime;
  bool? active;
  String? createDate;
  String? titleNoti;
  String? summaryNoti;
  int? numberOfConnection;
  String? approval;
  bool? status;
  bool? isHorizontal;
  int? category;
  int? subcategory;
  int? broker;
  String? createdUser;

  StreamModel(
      {this.id,
        this.watchlist,
        this.streamFlatformImage,
        this.categoryName,
        this.subcategoryName,
        this.title,
        this.description,
        this.subIcon,
        this.uidSubIcon,
        this.showDate,
        this.timeShowDate,
        this.closeDate,
        this.timeCloseDate,
        this.postDate,
        this.postTime,
        this.closePostDate,
        this.closePostTime,
        this.active,
        this.createDate,
        this.titleNoti,
        this.summaryNoti,
        this.numberOfConnection,
        this.approval,
        this.status,
        this.isHorizontal,
        this.category,
        this.subcategory,
        this.broker,
        this.createdUser});

  StreamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['watchlist'] != null) {
      watchlist = <WatchModel>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(WatchModel.fromJson(v));
      });
    }
    if (json['stream_flatform_image'] != null) {
      streamFlatformImage = <StreamFlatformImage>[];
      json['stream_flatform_image'].forEach((v) {
        streamFlatformImage!.add(StreamFlatformImage.fromJson(v));
      });
    }
    categoryName = json['category_name'];
    subcategoryName = json['subcategory_name'];
    title = json['title'];
    description = json['description'];
    subIcon = json['sub_icon'];
    uidSubIcon = json['uid_sub_icon'];
    showDate = json['show_date'];
    timeShowDate = json['time_show_date'];
    closeDate = json['close_date'];
    timeCloseDate = json['time_close_date'];
    postDate = json['post_date'];
    postTime = json['post_time'];
    closePostDate = json['close_post_date'];
    closePostTime = json['close_post_time'];
    active = json['active'];
    createDate = json['create_date'];
    titleNoti = json['titleNoti'];
    summaryNoti = json['summaryNoti'];
    numberOfConnection = json['number_of_connection'];
    approval = json['approval'];
    status = json['status'];
    isHorizontal = json['is_horizontal'];
    category = json['category'];
    subcategory = json['subcategory'];
    broker = json['broker'];
    createdUser = json['created_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (watchlist != null) {
      data['watchlist'] = watchlist!.map((v) => v.toJson()).toList();
    }
    if (streamFlatformImage != null) {
      data['stream_flatform_image'] =
          streamFlatformImage!.map((v) => v.toJson()).toList();
    }
    data['category_name'] = categoryName;
    data['subcategory_name'] = subcategoryName;
    data['title'] = title;
    data['description'] = description;
    data['sub_icon'] = subIcon;
    data['uid_sub_icon'] = uidSubIcon;
    data['show_date'] = showDate;
    data['time_show_date'] = timeShowDate;
    data['close_date'] = closeDate;
    data['time_close_date'] = timeCloseDate;
    data['post_date'] = postDate;
    data['post_time'] = postTime;
    data['close_post_date'] = closePostDate;
    data['close_post_time'] = closePostTime;
    data['active'] = active;
    data['create_date'] = createDate;
    data['titleNoti'] = titleNoti;
    data['summaryNoti'] = summaryNoti;
    data['number_of_connection'] = numberOfConnection;
    data['approval'] = approval;
    data['status'] = status;
    data['is_horizontal'] = isHorizontal;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['broker'] = broker;
    data['created_user'] = createdUser;
    return data;
  }
}


class StreamFlatformImage {
  int? id;
  String? uid;
  String? name;
  String? description;
  String? file;
  int? event;

  StreamFlatformImage(
      {this.id, this.uid, this.name, this.description, this.file, this.event});

  StreamFlatformImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
    file = json['file'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['name'] = name;
    data['description'] = description;
    data['file'] = file;
    data['event'] = event;
    return data;
  }
}
