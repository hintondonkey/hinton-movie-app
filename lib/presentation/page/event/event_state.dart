import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class EventState extends BaseState {
  EventState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.subCategories,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  final List<SubCategoryModel>? subCategories;

  EventState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    List<SubCategoryModel>? subCategories,
  }) {
    return EventState(
      loadingStatus: loadingStatus,
      failure: failure,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}
