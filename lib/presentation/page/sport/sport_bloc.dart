import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class SportBloc extends BaseBloc<BaseEvent, SportState> with Validators {
  SportBloc() : super(initState: SportState());

  @override
  dispose() {}
}
