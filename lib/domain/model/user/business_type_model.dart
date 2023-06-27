class BusinessTypeModel {
  int? id;
  String? createdAt;
  String? modifiedDate;
  String? name;
  String? description;

  BusinessTypeModel(
      {this.id,
        this.createdAt,
        this.modifiedDate,
        this.name,
        this.description});

  BusinessTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    modifiedDate = json['modified_date'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['modified_date'] = modifiedDate;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}