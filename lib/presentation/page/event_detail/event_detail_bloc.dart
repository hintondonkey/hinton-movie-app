import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/use_case/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class EventDetailBloc extends BaseBloc<BaseEvent, EventDetailState>
    with Validators {
  EventDetailBloc(
    this._fetchStreamByIdUseCase,
  ) : super(initState: EventDetailState()) {
    on<FetchStreamByIdEvent>(_onFetchStreamByIdEvent);
  }

  final FetchStreamByIdUseCase _fetchStreamByIdUseCase;

  @override
  dispose() {}

  FutureOr<void> _onFetchStreamByIdEvent(
      FetchStreamByIdEvent event, Emitter<EventDetailState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final r = await _fetchStreamByIdUseCase.fetchStreamById(param: event.param);
    r.fold(
        (l) => emit(
            state.copyWith(loadingStatus: LoadingStatus.finish, failure: l)),
        (r) => emit(state.copyWith(
            loadingStatus: LoadingStatus.finish, streamModel: r)));
  }
}
