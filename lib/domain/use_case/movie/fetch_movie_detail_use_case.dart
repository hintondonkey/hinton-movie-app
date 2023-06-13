import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchMovieDetailUseCase {
  Future<Either<Failure, MovieModel>> fetchMovieDetails(
      {required GetMovieDetailParam param});
}

class FetchMovieDetailUseCaseImpl extends BaseUseCase<MovieModel>
    implements FetchMovieDetailUseCase {
  FetchMovieDetailUseCaseImpl(
    this._movieRepository,
  );

  final MovieRepository _movieRepository;
  late GetMovieDetailParam _param;

  @override
  Future<Either<Failure, MovieModel>> fetchMovieDetails(
      {required GetMovieDetailParam param}) async {
    _param = param;
    return execute();
  }

  @override
  Future<MovieModel> main() async {
    var result = await _movieRepository.fetchMovieDetail(param: _param);
    return result;
  }
}
