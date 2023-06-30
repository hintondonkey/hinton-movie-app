import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchStreamBySubCategoryUseCase {
  Future<Either<Failure, List<StreamModel>>> fetchStreamBySubCategory(
      {required FetchStreamBySubCategoryParam param});
}

class FetchStreamBySubCategoryUseCaseImpl extends BaseUseCase<List<StreamModel>>
    implements FetchStreamBySubCategoryUseCase {
  FetchStreamBySubCategoryUseCaseImpl(
    this._streamRepository,
  );

  final StreamRepository _streamRepository;
  late FetchStreamBySubCategoryParam _param;

  @override
  Future<Either<Failure, List<StreamModel>>> fetchStreamBySubCategory(
      {required FetchStreamBySubCategoryParam param}) async {
    _param = param;
    return execute();
  }

  @override
  Future<List<StreamModel>> main() async {
    var result =
        await _streamRepository.fetchStreamBySubCategory(param: _param);
    return result;
  }
}
