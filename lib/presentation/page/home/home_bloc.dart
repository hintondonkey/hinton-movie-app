import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

import 'index.dart';

class HomeBloc extends BaseBloc<BaseEvent, HomeState> with Validators {
  HomeBloc(
    this._fetchMovieUseCase,
    this._pushHandler,
  ) : super(initState: HomeState()) {
    on<FetchMoviesEvent>(_onFetchMoviesEvent);
  }

  final FetchMoviesUseCase _fetchMovieUseCase;
  final PushNotificationHandler _pushHandler;

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
    _registerNotificationToken();
    dispatchEvent(FetchMoviesEvent());
  }

  _registerNotificationToken() async {
    final token = await _pushHandler.getNotifyToken();
  }

  @override
  dispose() {}

  FutureOr<void> _onFetchMoviesEvent(
      FetchMoviesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final r = await _fetchMovieUseCase.fetchMovies();
    r.fold(
        (l) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, failure: l)),
        (r) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, movies: r)));
  }
}
