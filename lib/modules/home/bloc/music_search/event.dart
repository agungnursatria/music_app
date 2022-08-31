part of 'bloc.dart';

/// [MusicSearchEvent] is the state of the [MusicSearchBloc]
///
@immutable
abstract class MusicSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MusicSearchGetData extends MusicSearchEvent {
  final String? term;
  MusicSearchGetData({this.term});

  @override
  List<Object?> get props => [term];
}
