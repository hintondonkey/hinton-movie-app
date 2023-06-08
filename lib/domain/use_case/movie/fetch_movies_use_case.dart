import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/domain/repository/index.dart';
import 'package:movie_app/domain/use_case/index.dart';

abstract class FetchMoviesUseCase {
  Future<Either<Failure, List<MovieModel>>> fetchMovies();
}

class FetchMoviesUseCaseImpl extends BaseUseCase<List<MovieModel>>
    implements FetchMoviesUseCase {
  FetchMoviesUseCaseImpl(
    this._movieRepository,
  );

  final MovieRepository _movieRepository;

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMovies() async {
    return execute();
  }

  @override
  Future<List<MovieModel>> main() async {
    var result = await _movieRepository.fetchMovies();
    return result;
  }
}
