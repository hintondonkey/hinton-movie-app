import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class LoginBloc extends BaseBloc<BaseEvent, LoginState> with Validators {
  LoginBloc() : super(initState: LoginState());

  @override
  dispose() {}
}
