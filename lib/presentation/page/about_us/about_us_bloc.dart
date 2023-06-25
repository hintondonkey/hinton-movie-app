import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class AboutUsBloc extends BaseBloc<BaseEvent, AboutUsState> with Validators {
  AboutUsBloc() : super(initState: AboutUsState());

  @override
  dispose() {}
}
