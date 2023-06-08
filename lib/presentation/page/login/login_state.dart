import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class LoginState extends BaseState {
  LoginState({
    LoadingStatus? loadingStatus,
    Failure? failure,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  LoginState copyWith({LoadingStatus? loadingStatus, Failure? failure}) {
    return LoginState(loadingStatus: loadingStatus, failure: failure);
  }
}
