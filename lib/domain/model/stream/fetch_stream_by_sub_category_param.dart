class FetchStreamBySubCategoryParam {
  final int brokerId;
  final int categoryId;
  final int? subCategoryId;

  FetchStreamBySubCategoryParam({
    required this.brokerId,
    required this.categoryId,
    this.subCategoryId
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['broker_id'] = brokerId;
    data['category_id'] = categoryId;
    data['subCategoryId'] = subCategoryId;
    return data;
  }
}
