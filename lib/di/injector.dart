import 'package:get_it/get_it.dart';
import 'package:music_app/config/network/http/network_http_interface.dart';
import 'package:music_app/config/network/http/network_http_library.dart';
import 'package:music_app/modules/home/services/service.dart';

/// [Injector] is a Service Locator for Dart and Flutter.
/// It can be used instead of InheritedWidget or Provider to access objects.
class Injector {
  Injector._();
  static final Injector _instance = Injector._();
  factory Injector() => _instance;

  /* ----------- PARAMETER ----------- */
  final _container = GetIt.instance;

  /* ----------- FUNCTION ----------- */

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
    _container.registerLazySingleton(() => HomeService(network: _container()));
  }

  T find<T extends Object>() => _container.get<T>();
}
