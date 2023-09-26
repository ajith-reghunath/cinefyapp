part of 'ui_bloc.dart';

class UiEvent {}

class IndexChanged extends UiEvent {
  int? index;
  IndexChanged({this.index});
}
