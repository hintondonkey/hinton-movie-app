import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class EventBloc extends BaseBloc<BaseEvent, EventState> with Validators {
  EventBloc() : super(initState: EventState());

  @override
  dispose() {}
}
