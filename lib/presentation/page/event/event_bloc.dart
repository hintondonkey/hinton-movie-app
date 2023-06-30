import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class EventBloc extends BaseBloc<BaseEvent, EventState> with Validators {
  EventBloc(
    this._fetchSubCategoriesUseCase,
    this._fetchStreamBySubCategoryUseCase,
  ) : super(initState: EventState()) {
    on<FetchSubCategoriesEvent>(_onFetchSubCategoriesEvent);
    on<FetchStreamBySubCategoryEvent>(_onFetchStreamBySubCategoryEvent);
  }

  final FetchSubCategoriesUseCase _fetchSubCategoriesUseCase;
  final FetchStreamBySubCategoryUseCase _fetchStreamBySubCategoryUseCase;

  @override
  dispose() {}

  FutureOr<void> _onFetchSubCategoriesEvent(
      FetchSubCategoriesEvent event, Emitter<EventState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final r =
        await _fetchSubCategoriesUseCase.fetchSubCategories(param: event.param);

    r.fold(
        (l) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, failure: l)),
        (r) => emit(state.copyWith(
            loadingStatus: LoadingStatus.finish, subCategories: r)));
  }

  FutureOr<void> _onFetchStreamBySubCategoryEvent(
      FetchStreamBySubCategoryEvent event, Emitter<EventState> emit) async {
    emit(state.copyWith(loadingStream: true));
    final r = await _fetchStreamBySubCategoryUseCase.fetchStreamBySubCategory(
        param: event.param);
    r.fold((l) => emit(state.copyWith(loadingStream: false, failure: l)),
        (r) => emit(state.copyWith(loadingStream: false, streams: r)));
  }
}
