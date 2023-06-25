import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/presentation/base/index.dart';

import 'index.dart';

class NewsBloc extends BaseBloc<BaseEvent, NewsState> with Validators {
  NewsBloc() : super(initState: NewsState());

  @override
  dispose() {}
}
