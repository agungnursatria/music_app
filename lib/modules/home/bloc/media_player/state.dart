part of 'bloc.dart';

@immutable
abstract class MediaPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MediaPlayerInit extends MediaPlayerState {}

class MediaPlayerOnListen extends MediaPlayerState {}

class MediaPlayerOnPause extends MediaPlayerState {}

class MediaPlayerOnStopped extends MediaPlayerState {}
