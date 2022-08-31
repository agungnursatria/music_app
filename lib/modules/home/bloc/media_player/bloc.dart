import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class MediaPlayerBloc extends Bloc<MediaPlayerEvent, MediaPlayerState> {
  MediaPlayerBloc() : super(MediaPlayerInit()) {
    on<MediaPlayerStart>(_onMediaPlayerStart);
    on<MediaPlayerPause>(_onMediaPlayerPause);
    on<MediaPlayerStop>(_onMediaPlayerStop);
  }

  Future<void> _onMediaPlayerStart(
    MediaPlayerStart event,
    Emitter<MediaPlayerState> emit,
  ) async {}

  Future<void> _onMediaPlayerPause(
    MediaPlayerPause event,
    Emitter<MediaPlayerState> emit,
  ) async {}

  Future<void> _onMediaPlayerStop(
    MediaPlayerStop event,
    Emitter<MediaPlayerState> emit,
  ) async {}
}
