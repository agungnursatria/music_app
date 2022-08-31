import 'package:equatable/equatable.dart';
import 'package:music_app/models/music.dart';

class MusicList extends Equatable {
  const MusicList({
    this.resultCount,
    this.results,
  });

  final int? resultCount;
  final List<Music>? results;

  static MusicList? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return MusicList(
      resultCount: json["resultCount"],
      results: Music.parseList(json["results"]),
    );
  }

  @override
  List<Object?> get props => [resultCount, results];
}
