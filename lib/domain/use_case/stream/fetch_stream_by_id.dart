import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchStreamByIdUseCase {
  Future<Either<Failure, StreamModel>> fetchStreamById(
      {required FetchStreamByIdParam param});
}

class FetchStreamByIdUseCaseImpl extends BaseUseCase<StreamModel>
    implements FetchStreamByIdUseCase {
  FetchStreamByIdUseCaseImpl(
      this._streamRepository,
      );

  final StreamRepository _streamRepository;
  late FetchStreamByIdParam _param;

  @override
  Future<Either<Failure, StreamModel>> fetchStreamById(
      {required FetchStreamByIdParam param}) async {
    _param = param;
    return execute();
  }

  @override
  Future<StreamModel> main() async {
    var result =
    await _streamRepository.fetchStreamById(param: _param);
    return result;
  }
}
