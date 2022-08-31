part of 'bloc.dart';

@immutable
abstract class MediaPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MediaPlayerInit extends MediaPlayerState {}

class MediaPlayerOnListen extends MediaPlayerState {
  final Music music;
  MediaPlayerOnListen({required this.music});

  @override
  List<Object?> get props => [music];
}

class MediaPlayerOnPause extends MediaPlayerState {
  final Music music;
  MediaPlayerOnPause({required this.music});

  @override
  List<Object?> get props => [music];
}

class MediaPlayerOnStopped extends MediaPlayerState {}
