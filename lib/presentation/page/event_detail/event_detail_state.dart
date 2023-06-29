import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class EventDetailState extends BaseState {
  EventDetailState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  EventDetailState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return EventDetailState(loadingStatus: loadingStatus, failure: failure);
  }
}
