import 'package:get_it/get_it.dart';
import 'package:music_app/config/network/http/network_http_interface.dart';
import 'package:music_app/config/network/http/network_http_library.dart';
import 'package:music_app/modules/main/services/service.dart';

class Injector {
  Injector._();
  static final Injector _instance = Injector._();
  factory Injector() => _instance;

  final _container = GetIt.instance;

  void init() {
    /// Register Network
    _container
      ..registerLazySingleton(
        () => NetworkLibrary(),
      )
      ..registerLazySingleton(
        () => NetworkHttpInterface(library: _container()),
      );

    /// Register Service
    _container.registerLazySingleton(() => MainService(network: _container()));
  }
}
