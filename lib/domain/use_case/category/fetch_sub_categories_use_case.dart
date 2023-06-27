import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchSubCategoriesUseCase {
  Future<Either<Failure, List<SubCategoryModel>>> fetchSubCategories(
      {required FetchSubCategoriesParam param});
}

class FetchSubCategoriesUseCaseImpl extends BaseUseCase<List<SubCategoryModel>>
    implements FetchSubCategoriesUseCase {
  FetchSubCategoriesUseCaseImpl(
    this._categoryRepository,
  );

  final CategoryRepository _categoryRepository;
  late FetchSubCategoriesParam _param;

  @override
  Future<Either<Failure, List<SubCategoryModel>>> fetchSubCategories(
      {required FetchSubCategoriesParam param}) async {
    _param = param;
    return execute();
  }

  @override
  Future<List<SubCategoryModel>> main() async {
    var result = await _categoryRepository.fetchSubCategories(param: _param);
    return result;
  }
}
