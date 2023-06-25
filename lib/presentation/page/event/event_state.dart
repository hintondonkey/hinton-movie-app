import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class EventState extends BaseState {
  EventState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  EventState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return EventState(loadingStatus: loadingStatus, failure: failure);
  }
}
