part of 'bloc.dart';

@immutable
abstract class MediaPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MediaPlayerListen extends MediaPlayerEvent {
  final Music music;
  MediaPlayerListen({required this.music});

  @override
  List<Object?> get props => [music];
}

class MediaPlayerPause extends MediaPlayerEvent {}
