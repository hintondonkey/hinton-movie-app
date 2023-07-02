import 'package:movie_app/domain/model/index.dart';

class SubCategoryModel {
  int? id;
  BrokerModel? broker;
  int? totalEvent;
  CreatedUserModel? createdUser;
  String? categoryName;
  String? createdAt;
  String? modifiedDate;
  String? name;
  String? description;
  String? image;
  int? category;

  SubCategoryModel(
      {this.id,
        this.broker,
        this.totalEvent,
        this.createdUser,
        this.categoryName,
        this.createdAt,
        this.modifiedDate,
        this.name,
        this.description,
        this.image,
        this.category});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    broker =
    json['broker'] != null ? BrokerModel.fromJson(json['broker']) : null;
    totalEvent = json['total_event'];
    createdUser = json['created_user'] != null
        ? CreatedUserModel.fromJson(json['created_user'])
        : null;
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    modifiedDate = json['modified_date'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (broker != null) {
      data['broker'] = broker!.toJson();
    }
    data['total_event'] = totalEvent;
    if (createdUser != null) {
      data['created_user'] = createdUser!.toJson();
    }
    data['category_name'] = categoryName;
    data['created_at'] = createdAt;
    data['modified_date'] = modifiedDate;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}


class CreatedUserModel {
  int? id;
  String? username;
  String? email;

  CreatedUserModel({this.id, this.username, this.email});

  CreatedUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
