import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';

/// [MediaPlayerView] is a widget used to display the selected music
/// and control the audio player.
///
/// This component will display selected song title, artist name, and album name.
class MediaPlayerView extends StatefulWidget {
  final Music? music;
  final VoidCallback onResume;
  final VoidCallback onPause;
  final bool isPlaying;

  const MediaPlayerView({
    Key? key,
    this.music,
    required this.onResume,
    required this.onPause,
    required this.isPlaying,
  }) : super(key: key);

  @override
  State<MediaPlayerView> createState() => _MediaPlayerViewState();
}

class _MediaPlayerViewState extends State<MediaPlayerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[400]),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Music Details
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Artwork
                SizedBox(
                  width: 48,
                  child: Image.network(
                    widget.music?.artworkUrl100 ?? '',
                    width: 48,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(
                        Icons.image,
                        size: 60,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Artist Name
                      Text(
                        widget.music?.artistName ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),

                      // Song Name
                      Text(
                        widget.music?.trackName ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Player Button
          widget.isPlaying
              ? IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 32,
                  onPressed: widget.onPause,
                )
              : IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 32,
                  onPressed: widget.onResume,
                ),
        ],
      ),
    );
  }
}
