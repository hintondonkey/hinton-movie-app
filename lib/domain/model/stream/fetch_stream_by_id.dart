class FetchStreamByIdParam {
  final int streamId;

  FetchStreamByIdParam({
    required this.streamId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['streamId'] = streamId;

    return data;
  }
}