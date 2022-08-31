// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/models/music_list.dart';
import 'package:music_app/modules/home/widgets/components/music_tile.dart';

/// [MusicListView] is a widget show list of music.
class MusicListView extends StatelessWidget {
  final MusicList musicList;
  final Music? playedMusic;
  final Function(Music) onTapItem;

  const MusicListView({
    Key? key,
    required this.musicList,
    this.playedMusic,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: musicList.resultCount ?? 0,
      itemBuilder: ((context, index) {
        Music _music = musicList.results![index];
        bool _isPlaying =
            playedMusic != null && _music.trackId == playedMusic!.trackId;

        return MusicTile(
          isPlaying: _isPlaying,
          music: _music,
          onTapItem: onTapItem,
        );
      }),
    );
  }
}
