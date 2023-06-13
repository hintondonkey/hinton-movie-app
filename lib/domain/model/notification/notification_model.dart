import 'dart:convert';

import 'package:movie_app/core/utils/index.dart';

class NotificationModel {
  int? movieId;

  NotificationModel({
    this.movieId,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    movieId = json['id']?.toString().toIntValue() ?? -1;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': movieId,
    };
  }

  String toJsonString() {
    final json = toJson();
    return jsonEncode(json);
  }
}
