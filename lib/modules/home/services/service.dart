import 'package:dartz/dartz.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/config/network/http/network_http_interface.dart';
import 'package:music_app/config/network/http/network_http_model.dart';

class HomeService {
  NetworkHttpInterface network;
  HomeService({required this.network});

  Future<Either<NetworkModel, NetworkError>> getMusic(String? query) async {
    return await network.requestGetNoAuth(
      path: '/search',
      queryParameters: {
        "term": query,
        "entity": "musicTrack",
        "attribute": "artistTerm",
      },
    );
  }
}
