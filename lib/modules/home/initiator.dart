import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/di/injector.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/modules/home/bloc/media_player/bloc.dart';
import 'package:music_app/modules/home/bloc/music_search/bloc.dart';
import 'package:music_app/modules/home/page.dart';
import 'package:music_app/modules/home/services/service.dart';
import 'package:music_app/utils/debouncher.dart';
import 'package:music_app/utils/helper.dart';

class HomeInitiator {
  late MusicSearchBloc _bloc;
  late MediaPlayerBloc _mpBloc;
  late TextEditingController _searchController;
  late AudioPlayer _player;
  late Debouncer _debouncer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  /* ----------- PARAMETER ----------- */
  MusicSearchBloc get bloc => _bloc;
  MediaPlayerBloc get mpBloc => _mpBloc;
  TextEditingController get searchController => _searchController;
  AudioPlayer get player => _player;
  AnimationController get animationController => _animationController;
  Animation<double> get animation => _animation;

  /* ----------- FUNCTION ----------- */

  /// [init] is triggered when [HomePage] is inserted to the tree.
  /// It initialize object will be used in [HomePage]
  ///
  void init(TickerProvider tickerProvider) {
    _bloc = MusicSearchBloc(service: Injector().find<HomeService>());
    _mpBloc = MediaPlayerBloc();
    _searchController = TextEditingController();
    _player = AudioPlayer();
    _player.setVolume(100);
    _debouncer = Debouncer(milliseconds: 500);

    _animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _bloc.add(MusicSearchGetData());
  }

  /// [dispose] is triggered when [HomePage] is removed from the tree.
  /// It discard & disable objects that no longer needed.
  ///
  void dispose() {
    _bloc.close();
    _mpBloc.close();
    _searchController.dispose();
    _player.dispose();
    _debouncer.stop();
    _animationController.dispose();
  }

  /// [onSearch] is triggered whenever the user typing on search form.
  /// It debounces the search so that it only fires when the user stops typing.
  /// It then calls [MusicSearchGetData] to get data from API.
  ///
  void onSearch(String term) {
    _debouncer.run(action: () {
      _bloc.add(MusicSearchGetData(term: term));
    });
  }

  /// [onTapItem] is triggered whenever the user select a music from list
  /// This function is used to play the music.
  /// It will trigger the [MediaPlayerListen] event and player the music.
  ///
  void onTapItem(Music music) {
    _mpBloc.add(MediaPlayerListen(music: music));
    _player
        .setAudioSource(AudioSource.uri(Uri.parse(music.previewUrl ?? '')))
        .onError((e, s) => Helper.catchError(e, s));
  }

  /// [onTapResume] is triggered whenever the user select resume button on media player
  /// This function is used to play the music.
  ///
  void onTapResume() {
    _player.play();
  }

  /// [onTapPause] is triggered whenever the user select pause button on media player
  /// This function is used to pause the music.
  ///
  void onTapPause() {
    _player.pause();
  }

  /// [onPlayerListen] is triggered when player start listen music
  /// It will trigger the [_animationController] to show the media player.
  ///
  void onPlayerListen(Music music) {
    _animationController.forward();
    _player.play();
  }

  /// [onPlayerCompleted] is triggered when player finished listen music
  /// It will trigger the [_animationController] to hide the media player.
  /// It will also reset the media player state to [MediaPlayerInit]
  void onPlayerCompleted() {
    _player.stop();
    _animationController.reverse();
    _mpBloc.add(MediaPlayerReset());
  }
}
