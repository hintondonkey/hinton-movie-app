import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';

abstract class EventDetailEvent extends BaseEvent {}

class FetchStreamByIdEvent extends EventDetailEvent {
  final FetchStreamByIdParam param;

  FetchStreamByIdEvent({
    required this.param,
  });
}
