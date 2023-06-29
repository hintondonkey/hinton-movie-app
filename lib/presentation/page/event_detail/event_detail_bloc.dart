import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class EventDetailBloc extends BaseBloc<BaseEvent, EventDetailState> with Validators {
  EventDetailBloc() : super(initState: EventDetailState());

  @override
  dispose() {}
}
