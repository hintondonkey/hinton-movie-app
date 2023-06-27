import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/enum/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchCategoriesUseCase {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories(
      {required FetchCategoriesParam param});
}

class FetchCategoriesUseCaseImpl extends BaseUseCase<List<CategoryModel>>
    implements FetchCategoriesUseCase {
  FetchCategoriesUseCaseImpl(
    this._categoryRepository,
  );

  final CategoryRepository _categoryRepository;
  late FetchCategoriesParam _param;

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories(
      {required FetchCategoriesParam param}) async {
    _param = param;
    return execute();
  }

  @override
  Future<List<CategoryModel>> main() async {
    var result = await _categoryRepository.fetchCategories(param: _param);
    return result;
  }
}
