class FetchSubCategoriesParam {
  final int categoryId;

  FetchSubCategoriesParam({
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    return data;
  }
}
