// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/config/network/http/network_http_model.dart';
import 'package:music_app/models/music_list.dart';
import 'package:music_app/modules/home/bloc/music_search/bloc.dart';
import 'package:music_app/modules/home/services/service.dart';

import 'music_search_bloc_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  late MusicSearchBloc _bloc;
  late MusicSearchState _state;
  HomeService _service = MockHomeService();
  late Map<String, dynamic> _response;
  MusicList? _musicList;

  setUp(() {
    _bloc = MusicSearchBloc(service: _service);
    _state = MusicSearchInit();
    _response = {
      "resultCount": 1,
      "results": [
        {
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
        },
      ],
    };

    _musicList = MusicList.fromJson(_response);
  });

  tearDown(() {
    _bloc.close();
  });

  test('Initial state is correct', () {
    expect(_state, _bloc.state);
  });

  blocTest<MusicSearchBloc, MusicSearchState>(
    'Close doesn\'t emit new states',
    build: () => _bloc,
    act: (bloc) => bloc.close(),
    expect: () => [],
  );

  group('MusicSearchBloc', () {
    blocTest(
      'emits [MusicSearchLoaded] when [MusicSearchGetData] is called',
      build: () => _bloc,
      act: (_) {
        when(_service.searchMusic("yoasobi")).thenAnswer((_) async {
          return Left<NetworkModel, NetworkError>(
            NetworkModel(
              response: _response,
              code: 200,
            ),
          );
        });

        _bloc.add(MusicSearchGetData(term: 'yoasobi'));
      },
      expect: () => [
        MusicSearchLoading(),
        MusicSearchLoaded(musicList: _musicList),
      ],
    );
  });
}
