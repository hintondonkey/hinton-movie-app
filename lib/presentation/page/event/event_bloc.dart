import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class EventBloc extends BaseBloc<BaseEvent, EventState> with Validators {
  EventBloc(
    this._fetchSubCategoriesUseCase,
  ) : super(initState: EventState()) {
    on<FetchSubCategoriesEvent>(_onFetchSubCategoriesEvent);
  }

  final FetchSubCategoriesUseCase _fetchSubCategoriesUseCase;

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
}
