import 'package:movie_app/domain/model/category/index.dart';
import 'package:movie_app/presentation/base/index.dart';

abstract class MainEvent extends BaseEvent {}

class FetchCategoriesEvent extends MainEvent {
  FetchCategoriesEvent({
    required this.param,
  });

  final FetchCategoriesParam param;
}
