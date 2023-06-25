import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class SportState extends BaseState {
  SportState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  SportState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return SportState(loadingStatus: loadingStatus, failure: failure);
  }
}
