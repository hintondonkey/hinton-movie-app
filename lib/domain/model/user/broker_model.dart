import 'package:movie_app/domain/model/index.dart';

class BrokerModel {
  int? id;
  BusinessTypeModel? businessType;
  String? createdAt;
  String? modifiedDate;
  String? name;
  bool? isNetwork;
  int? numberOfUsers;

  BrokerModel(
      {this.id,
      this.businessType,
      this.createdAt,
      this.modifiedDate,
      this.name,
      this.isNetwork,
      this.numberOfUsers});

  BrokerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessType = json['business_type'] != null
        ? BusinessTypeModel.fromJson(json['business_type'])
        : null;
    createdAt = json['created_at'];
    modifiedDate = json['modified_date'];
    name = json['name'];
    isNetwork = json['is_network'];
    numberOfUsers = json['number_of_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (businessType != null) {
      data['business_type'] = businessType!.toJson();
    }
    data['created_at'] = createdAt;
    data['modified_date'] = modifiedDate;
    data['name'] = name;
    data['is_network'] = isNetwork;
    data['number_of_users'] = numberOfUsers;
    return data;
  }
}
