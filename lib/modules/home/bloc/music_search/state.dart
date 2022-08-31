part of 'bloc.dart';

@immutable
abstract class MusicSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MusicSearchInit extends MusicSearchState {}

class MusicSearchLoading extends MusicSearchState {}

class MusicSearchLoaded extends MusicSearchState {
  final MusicList? musicList;

  MusicSearchLoaded({this.musicList});

  MusicSearchLoaded copyWith({
    MusicList? musicList,
  }) {
    return MusicSearchLoaded(
      musicList: musicList,
    );
  }

  @override
  List<Object?> get props => [musicList];
}

class MusicSearchError extends MusicSearchState {
  final NetworkError error;
  MusicSearchError({required this.error});

  @override
  List<Object?> get props => [error];
}
