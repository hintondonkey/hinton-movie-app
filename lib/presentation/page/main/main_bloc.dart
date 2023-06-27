import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/data/remote/api/index.dart';
import 'package:movie_app/domain/model/category/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class MainBloc extends BaseBloc<BaseEvent, MainState> with Validators {
  MainBloc(
    this._fetchCategoriesUseCase,
  ) : super(initState: MainState()) {
    on<FetchCategoriesEvent>(_onFetchCategoriesEvent);
  }

  final FetchCategoriesUseCase _fetchCategoriesUseCase;

  @override
  dispose() {}

  FutureOr<void> _onFetchCategoriesEvent(
      FetchCategoriesEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final r = await _fetchCategoriesUseCase.fetchCategories(param: event.param);

    r.fold(
        (l) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, failure: l)),
        (r) => emit(state.copyWith(
            loadingStatus: LoadingStatus.finish, categories: r)));
  }

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
    dispatchEvent(
        FetchCategoriesEvent(param: FetchCategoriesParam(brokerId: kBrokerId)));
  }
}
