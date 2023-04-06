import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecase/get_movies_usecase.dart';
import 'package:movie_app/ui/screen/homepage/home_page_event.dart';
import 'package:movie_app/ui/screen/homepage/home_page_state.dart';

import '../../../data/remote/api/error_from_server.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePagesState> {
  HomePageBloc() : super(HomePagesState());

  final GetMoviesUsecase getMoviesUsecase = GetMoviesUsecase();

  @override
  Stream<HomePagesState> mapEventToState(HomePageEvent event) async* {
    if (event is GetMovieEvent) {
      yield* _mapGetMovieEventToState(event, state);
    }
  }

  Stream<HomePagesState> _mapGetMovieEventToState(
      GetMovieEvent event, HomePagesState state) async* {
    try {
      final dataMovie = await getMoviesUsecase.getMoviesApi();
      yield state.copyWith(mvList: dataMovie);
    } on ErrorFromServer catch (e) {}
  }
}
