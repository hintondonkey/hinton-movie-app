import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

abstract class EventEvent extends BaseEvent {}

class FetchSubCategoriesEvent extends EventEvent {
  final FetchSubCategoriesParam param;

  FetchSubCategoriesEvent({
    required this.param,
  });
}
