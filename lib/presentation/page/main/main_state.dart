import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class MainState extends BaseState {
  MainState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  MainState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return MainState(loadingStatus: loadingStatus, failure: failure);
  }
}
