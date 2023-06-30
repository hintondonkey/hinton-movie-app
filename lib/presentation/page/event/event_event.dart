import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

abstract class EventEvent extends BaseEvent {}

class FetchSubCategoriesEvent extends EventEvent {
  final FetchSubCategoriesParam param;

  FetchSubCategoriesEvent({
    required this.param,
  });
}

class NavigateEventDetailScreen extends EventEvent {
  final int eventId;

  NavigateEventDetailScreen({
    required this.eventId,
  });
}

class FetchStreamBySubCategoryEvent extends EventEvent {
  final FetchStreamBySubCategoryParam param;

  FetchStreamBySubCategoryEvent({
    required this.param,
  });
}
