class GetMovieDetailParam {
  final int movieId;

  GetMovieDetailParam({
    required this.movieId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = movieId;
    return data;
  }
}
