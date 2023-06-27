class FetchCategoriesParam {
  final int brokerId;

  FetchCategoriesParam({
    required this.brokerId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brokerId'] = brokerId;
    return data;
  }
}
