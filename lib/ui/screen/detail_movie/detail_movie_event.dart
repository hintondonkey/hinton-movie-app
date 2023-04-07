import 'package:equatable/equatable.dart';

class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object?> get props => [];
}

class GetMovieEvent extends DetailMovieEvent {
  final int id;
  const GetMovieEvent(this.id);
}
