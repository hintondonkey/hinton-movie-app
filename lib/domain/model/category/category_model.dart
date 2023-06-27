import 'package:movie_app/domain/enum/category.dart';

class CategoryModel {
  int? id;
  String? totalEvent;
  String? createdAt;
  String? modifiedDate;
  String? name;
  String? description;
  String? image;
  CategoryType? categoryType;

  CategoryModel(
      {this.id,
      this.totalEvent,
      this.createdAt,
      this.modifiedDate,
      this.name,
      this.description,
      required this.categoryType,
      this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalEvent = json['total_event'];
    createdAt = json['created_at'];
    modifiedDate = json['modified_date'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryType = getCategoryTypeFromString(category: name ?? 'About Us');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_event'] = totalEvent;
    data['created_at'] = createdAt;
    data['modified_date'] = modifiedDate;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
