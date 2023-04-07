import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/api/error_from_server.dart';
import '../../../domain/usecase/get_movies_usecase.dart';
import 'detail_movie_event.dart';
import 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc() : super(const DetailMovieState());
  final GetMoviesUsecase getMoviesUsecase = GetMoviesUsecase();

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetMovieEvent) {
      yield* _mapGetMovieEventToState(event, state);
    }
  }

  Stream<DetailMovieState> _mapGetMovieEventToState(
      GetMovieEvent event, DetailMovieState state) async* {
    try {
      final dataMovie = await getMoviesUsecase.getMoviesDetailApi(event.id);
      yield state.copyWith(mvList: dataMovie);
    } on ErrorFromServer catch (e) {
      print(e.message);
    }
  }
}
