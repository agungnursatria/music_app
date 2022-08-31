// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/models/music_list.dart';
import 'package:music_app/modules/home/page.dart';
import 'package:music_app/modules/home/widgets/components/media_player.dart';
import 'package:music_app/modules/home/widgets/components/music_list.dart';
import 'package:music_app/modules/home/widgets/components/music_search_bar.dart';
import 'package:music_app/modules/home/widgets/components/shimmer_list.dart';

/// [HomeView] is a [StatelessWidget] and the main view of [HomePage]
/// [HomeView] display [HomePage] view depend on the page's state
///
class HomeView extends StatelessWidget {
  final TextEditingController searchController;
  final MusicList? musicList;
  final Music? playedMusic;
  final bool isLoading;
  final bool isPlaying;
  final NetworkError? error;
  final Animation<double> animation;
  final Function(Music) onTapItem;
  final ValueChanged<String> onSearch;
  final VoidCallback onResume;
  final VoidCallback onPause;

  const HomeView({
    Key? key,
    required this.searchController,
    required this.playedMusic,
    required this.isLoading,
    required this.isPlaying,
    required this.animation,
    this.error,
    this.musicList,
    required this.onTapItem,
    required this.onSearch,
    required this.onResume,
    required this.onPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: MusicSearchBar(
            hintText: "Senam SKJ...",
            searchController: searchController,
            onSearch: onSearch,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: isLoading
                  ? ShimmerList()
                  : (error != null)
                      ? Center(child: Text(error!.message))
                      : searchController.text.isEmpty
                          ? Center(child: Text('Start Typing :D'))
                          : (musicList?.resultCount ?? 0) > 0
                              ? MusicListView(
                                  onTapItem: onTapItem,
                                  musicList: musicList!,
                                  playedMusic: playedMusic,
                                )
                              : Center(child: Text('No music found')),
            ),
            SizeTransition(
              sizeFactor: animation,
              child: MediaPlayerView(
                onPause: onPause,
                onResume: onResume,
                music: playedMusic,
                isPlaying: isPlaying,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
