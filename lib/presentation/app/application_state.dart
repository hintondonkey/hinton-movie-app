import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class ApplicationState extends BaseState {
  AppLaunchTag tag;

  ApplicationState({
    required this.tag,
    Failure? failure,
    LoadingStatus? status,
  }) : super(failure: failure, loadingStatus: status ?? LoadingStatus.none);

  ApplicationState copyWith({
    AppLaunchTag? tag,
    Failure? failure,
    LoadingStatus? status,
  }) {
    return ApplicationState(
        tag: tag ?? this.tag, failure: failure, status: status);
  }
}

const appLaunchErrorMessage = "application cannot start";

enum AppLaunchTag { splash, login, main, tutorial }
