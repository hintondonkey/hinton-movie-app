import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/model/movies_response.dart';

class HomePagesState extends Equatable {
  final List<MoviesResponse> mvList;

  HomePagesState({this.mvList = const []});

  HomePagesState copyWith({List<MoviesResponse>? mvList}) {
    return HomePagesState(mvList: mvList ?? this.mvList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [mvList];
}
