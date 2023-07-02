import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class EventDetailState extends BaseState {
  EventDetailState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.streamModel,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  final StreamModel? streamModel;

  EventDetailState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    StreamModel? streamModel,
  }) {
    return EventDetailState(
      loadingStatus: loadingStatus,
      failure: failure,
      streamModel: streamModel ?? this.streamModel,
    );
  }
}
