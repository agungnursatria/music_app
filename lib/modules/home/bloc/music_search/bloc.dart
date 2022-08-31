import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/models/music_list.dart';
import 'package:music_app/modules/home/services/service.dart';

part 'event.dart';
part 'state.dart';

/// [MusicSearchBloc] is a state management.
/// This BLoC function is to search music from API
///
class MusicSearchBloc extends Bloc<MusicSearchEvent, MusicSearchState> {
  final HomeService _service;

  MusicSearchBloc({required HomeService service})
      : _service = service,
        super(MusicSearchInit()) {
    on<MusicSearchGetData>(_onMusicListGetData);
  }

  /// This future hadle if event [MusicSearchGetData] is triggered
  ///
  Future<void> _onMusicListGetData(
    MusicSearchGetData event,
    Emitter<MusicSearchState> emit,
  ) async {
    emit(MusicSearchLoading());

    await _service.searchMusic(event.term).then(
          (foldable) => foldable.fold(
            (networkModel) => emit(MusicSearchLoaded(
              musicList: MusicList.fromJson(networkModel.response),
            )),
            (networkError) => emit(MusicSearchError(error: networkError)),
          ),
        );
  }
}
