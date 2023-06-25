import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class MainBloc extends BaseBloc<BaseEvent, MainState> with Validators {
  MainBloc() : super(initState: MainState());

  @override
  dispose() {}
}
