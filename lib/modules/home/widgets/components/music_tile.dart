import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';

/// [MusicTile] is a widget show the music item.
///
/// This component display  song title, artist name, and album name.
/// This component also display an indicator if the song is on listen
class MusicTile extends StatelessWidget {
  final bool isPlaying;
  final Music music;
  final Function(Music) onTapItem;

  const MusicTile({
    Key? key,
    required this.isPlaying,
    required this.music,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapItem(music),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // This widget will show the image of the song
            Image.network(
              music.artworkUrl100 ?? '',
              width: 64,
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Song Name
                  Text(
                    music.trackName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Artist Name
                  Text(
                    music.artistName ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),

                  // Album Name
                  Text(
                    music.collectionName ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            if (isPlaying) ...[
              const SizedBox(width: 16),
              const Icon(
                Icons.play_circle_outlined,
                color: Colors.green,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
