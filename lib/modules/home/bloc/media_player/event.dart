part of 'bloc.dart';

@immutable
abstract class MediaPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MediaPlayerStart extends MediaPlayerEvent {}

class MediaPlayerPause extends MediaPlayerEvent {}

class MediaPlayerStop extends MediaPlayerEvent {}
