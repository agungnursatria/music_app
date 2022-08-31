part of 'bloc.dart';

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
