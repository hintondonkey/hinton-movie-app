import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class NewsState extends BaseState {
  NewsState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  NewsState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return NewsState(loadingStatus: loadingStatus, failure: failure);
  }
}
