import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/music.dart';

part 'event.dart';
part 'state.dart';

/// [MediaPlayerBloc] is a state management.
/// This BLoC function is to manage the music played
///
class MediaPlayerBloc extends Bloc<MediaPlayerEvent, MediaPlayerState> {
  MediaPlayerBloc() : super(MediaPlayerInit()) {
    on<MediaPlayerListen>(_onMediaPlayerListen);
  }

  Future<void> _onMediaPlayerListen(
    MediaPlayerListen event,
    Emitter<MediaPlayerState> emit,
  ) async {
    emit(MediaPlayerOnListen(music: event.music));
  }
}
