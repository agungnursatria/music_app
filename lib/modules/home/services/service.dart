// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dartz/dartz.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/config/network/http/network_http_interface.dart';
import 'package:music_app/config/network/http/network_http_model.dart';
import 'package:music_app/utils/helper.dart';

/// [HomeService] has responsibility to fetch the data from the API
///
class HomeService {
  NetworkHttpInterface network;
  HomeService({required this.network});

  /// This function to fetch music from API
  Future<Either<NetworkModel, NetworkError>> searchMusic(String? term) async {
    return await network.requestGetNoAuth(
      path: '/search',
      queryParameters: {
        "term": Helper.spaceToPlus(term),
        "entity": "musicTrack",
        "attribute": "artistTerm",
      },
    );
  }
}
