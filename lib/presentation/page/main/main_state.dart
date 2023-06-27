import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class MainState extends BaseState {
  MainState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.categories,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  final List<CategoryModel>? categories;

  MainState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    List<CategoryModel>? categories,
  }) {
    return MainState(
      loadingStatus: loadingStatus,
      failure: failure,
      categories: categories ?? this.categories,
    );
  }
}
