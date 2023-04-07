import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/model/movies_response.dart';

class DetailMovieState extends Equatable {
  final MoviesResponse? mvList;

  const DetailMovieState({this.mvList});

  DetailMovieState copyWith({MoviesResponse? mvList}) {
    return DetailMovieState(mvList: mvList ?? this.mvList);
  }

  @override
  List<Object?> get props => [mvList];
}
