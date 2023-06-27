import 'package:movie_app/domain/model/index.dart';

class SubCategoryModel {
  int? id;
  BrokerModel? broker;
  String? totalEvent;
  String? createdAt;
  String? modifiedDate;
  String? name;
  String? description;
  String? image;
  int? category;
  int? createdUser;

  SubCategoryModel(
      {this.id,
      this.broker,
      this.totalEvent,
      this.createdAt,
      this.modifiedDate,
      this.name,
      this.description,
      this.image,
      this.category,
      this.createdUser});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    broker =
        json['broker'] != null ? BrokerModel.fromJson(json['broker']) : null;
    totalEvent = json['total_event'];
    createdAt = json['created_at'];
    modifiedDate = json['modified_date'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
    createdUser = json['created_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (broker != null) {
      data['broker'] = broker!.toJson();
    }
    data['total_event'] = totalEvent;
    data['created_at'] = createdAt;
    data['modified_date'] = modifiedDate;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category'] = category;
    data['created_user'] = createdUser;
    return data;
  }
}
