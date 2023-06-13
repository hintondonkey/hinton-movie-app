import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class MovieDetailBloc extends BaseBloc<BaseEvent, MovieDetailState>
    with Validators {
  MovieDetailBloc(
    this._fetchMovieDetailUseCase,
  ) : super(initState: MovieDetailState()) {
    on<FetchMovieDetailEvent>(_onFetchMovieDetailEvent);
  }

  final FetchMovieDetailUseCase _fetchMovieDetailUseCase;

  @override
  dispose() {}

  FutureOr<void> _onFetchMovieDetailEvent(
      FetchMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final r = await _fetchMovieDetailUseCase.fetchMovieDetails(
        param: GetMovieDetailParam(movieId: event.movieId));
    r.fold(
        (l) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, failure: l)),
        (r) => emit(state.copyWith(loadingStatus: LoadingStatus.finish, movie: r)));
  }
}
