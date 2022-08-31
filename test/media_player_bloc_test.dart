import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/modules/home/bloc/media_player/bloc.dart';

void main() {
  late MediaPlayerBloc _bloc;
  late MediaPlayerState _state;
  late Music music;

  setUp(() {
    _bloc = MediaPlayerBloc();
    _state = MediaPlayerInit();

    music = Music.fromJson({
      "wrapperType": "track",
      "kind": "song",
      "artistId": 1490256993,
      "collectionId": 1542182291,
      "trackId": 1542182540,
      "artistName": "YOASOBI",
      "collectionName": "THE BOOK",
      "trackName": "Harujion",
      "collectionCensoredName": "THE BOOK",
      "trackCensoredName": "Harujion",
      "artistViewUrl":
          "https://music.apple.com/us/artist/yoasobi/1490256993?uo=4",
      "collectionViewUrl":
          "https://music.apple.com/us/album/harujion/1542182291?i=1542182540&uo=4",
      "trackViewUrl":
          "https://music.apple.com/us/album/harujion/1542182291?i=1542182540&uo=4",
      "previewUrl":
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f2/09/ea/f209ea6c-eaa3-1ad8-c6e3-efbd66ee8c72/mzaf_3188029878656765318.plus.aac.p.m4a",
      "artworkUrl30":
          "https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/4b/ba/5b/4bba5b81-c56e-1513-4326-e24daf4a7bff/195497666737.jpg/30x30bb.jpg",
      "artworkUrl60":
          "https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/4b/ba/5b/4bba5b81-c56e-1513-4326-e24daf4a7bff/195497666737.jpg/60x60bb.jpg",
      "artworkUrl100":
          "https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/4b/ba/5b/4bba5b81-c56e-1513-4326-e24daf4a7bff/195497666737.jpg/100x100bb.jpg",
      "collectionPrice": 11.61,
      "trackPrice": 1.29,
      "releaseDate": "2020-05-11T12:00:00Z",
      "collectionExplicitness": "notExplicit",
      "trackExplicitness": "notExplicit",
      "discCount": 1,
      "discNumber": 1,
      "trackCount": 9,
      "trackNumber": 3,
      "trackTimeMillis": 198600,
      "country": "USA",
      "currency": "USD",
      "primaryGenreName": "J-Pop",
      "isStreamable": true
    })!;
  });

  tearDown(() {
    _bloc.close();
  });

  test('Initial state is correct', () {
    expect(_state, _bloc.state);
  });

  blocTest<MediaPlayerBloc, MediaPlayerState>(
    'Close doesn\'t emit new states',
    build: () => _bloc,
    act: (bloc) => bloc.close(),
    expect: () => [],
  );

  group("MediaPlayerBloc", () {
    blocTest(
      "emits [MediaPlayerOnListen] when [MediaPlayerListen] is called",
      build: () => _bloc,
      act: (_) {
        _bloc.add(MediaPlayerListen(music: music));
      },
      expect: () => [
        MediaPlayerOnListen(music: music),
      ],
    );

    blocTest(
      "emits [MediaPlayerInit] when [MediaPlayerReset] is called",
      build: () => _bloc,
      act: (_) {
        _bloc.add(MediaPlayerListen(music: music));
        _bloc.add(MediaPlayerReset());
      },
      expect: () => [
        MediaPlayerOnListen(music: music),
        MediaPlayerInit(),
      ],
    );
  });
}
