import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

class EventState extends BaseState {
  EventState({
    LoadingStatus? loadingStatus,
    Failure? failure,
    this.subCategories,
    this.streams,
    this.loadingStream,
  }) : super(
            loadingStatus: loadingStatus ?? LoadingStatus.none,
            failure: failure);

  final List<SubCategoryModel>? subCategories;
  final List<StreamModel>? streams;
  final bool? loadingStream;

  EventState copyWith({
    LoadingStatus? loadingStatus,
    Failure? failure,
    List<SubCategoryModel>? subCategories,
    List<StreamModel>? streams,
    bool? loadingStream,
  }) {
    return EventState(
      loadingStatus: loadingStatus,
      failure: failure,
      subCategories: subCategories ?? this.subCategories,
      loadingStream: loadingStream ?? false,
      streams: streams,
    );
  }
}
