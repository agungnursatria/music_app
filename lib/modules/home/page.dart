// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/models/music_list.dart';
import 'package:music_app/modules/home/bloc/media_player/bloc.dart';
import 'package:music_app/modules/home/bloc/music_search/bloc.dart';
import 'package:music_app/modules/home/initiator.dart';
import 'package:music_app/modules/home/view.dart';

/// [HomePage] is [StatefulWidget] has a responsibility as
/// a bridge between [HomeView] and [HomeInitiator],
///
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomeInitiator _i;

  @override
  void initState() {
    super.initState();
    _i = HomeInitiator()..init(this);
  }

  @override
  void dispose() {
    _i.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: _i.player.playerStateStream,
      builder: (context, snapshot) {
        PlayerState? _playerState = snapshot.data;
        bool _isPlaying = _playerState?.playing ?? false;

        return BlocBuilder(
          bloc: _i.bloc,
          builder: (context, state) {
            return BlocConsumer(
              bloc: _i.mpBloc,
              listener: (context, mpState) {
                if (mpState is MediaPlayerOnListen) {
                  _i.onPlayerListen(mpState.music);
                }
              },
              builder: (context, mpState) {
                MusicList? _musicList;
                NetworkError? _error;
                Music? _playedMusic;

                if (state is MusicSearchLoaded) {
                  _musicList = state.musicList;
                }
                if (state is MusicSearchError) {
                  _error = state.error;
                }

                if (mpState is MediaPlayerOnListen) {
                  _playedMusic = mpState.music;
                }
                if (mpState is MediaPlayerOnPause) {
                  _playedMusic = mpState.music;
                }

                return HomeView(
                  error: _error,
                  playedMusic: _playedMusic,
                  isLoading: state is MusicSearchLoading,
                  isPlaying: _isPlaying,
                  musicList: _musicList,
                  onTapItem: _i.onTapItem,
                  animation: _i.animation,
                  onPause: _i.onTapPause,
                  onResume: _i.onTapResume,
                  onSearch: _i.onSearch,
                  searchController: _i.searchController,
                );
              },
            );
          },
        );
      },
    );
  }
}
