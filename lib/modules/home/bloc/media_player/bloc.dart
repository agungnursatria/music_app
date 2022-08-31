import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/music.dart';

part 'event.dart';
part 'state.dart';

class MediaPlayerBloc extends Bloc<MediaPlayerEvent, MediaPlayerState> {
  MediaPlayerBloc() : super(MediaPlayerInit()) {
    on<MediaPlayerListen>(_onMediaPlayerListen);
    on<MediaPlayerPause>(_onMediaPlayerPause);
  }

  Future<void> _onMediaPlayerListen(
    MediaPlayerListen event,
    Emitter<MediaPlayerState> emit,
  ) async {
    emit(MediaPlayerOnListen(music: event.music));
  }

  Future<void> _onMediaPlayerPause(
    MediaPlayerPause event,
    Emitter<MediaPlayerState> emit,
  ) async {
    if (state is! MediaPlayerOnListen) return;
    MediaPlayerOnListen mState = state as MediaPlayerOnListen;
    emit(MediaPlayerOnPause(music: mState.music));
  }
}
