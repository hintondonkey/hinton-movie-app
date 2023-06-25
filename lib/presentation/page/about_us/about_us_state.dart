import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class AboutUsState extends BaseState {
  AboutUsState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  AboutUsState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return AboutUsState(loadingStatus: loadingStatus, failure: failure);
  }
}
