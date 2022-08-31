import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/di/injector.dart';
import 'package:music_app/modules/home/bloc/media_player/bloc.dart';
import 'package:music_app/modules/home/bloc/music_search/bloc.dart';
import 'package:music_app/modules/home/services/service.dart';

class HomeInitiator {
  late MusicSearchBloc _bloc;
  late MediaPlayerBloc _mpBloc;
  late TextEditingController _searchController;
  late AudioPlayer _player;

  void init() {
    _bloc = MusicSearchBloc(service: Injector().find<HomeService>());
    _mpBloc = MediaPlayerBloc();
  }

  void dispose() {
    _bloc.close();
    _mpBloc.close();
    _searchController.dispose();
    _player.dispose();
  }
}
