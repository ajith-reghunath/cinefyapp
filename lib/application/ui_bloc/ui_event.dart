part of 'ui_bloc.dart';

class UiEvent {}

class IndexChanged extends UiEvent {
  int? index;
  IndexChanged({this.index});
}

class ProfileIndexChanged extends UiEvent {
  int? profileIndex;
  ProfileIndexChanged({this.profileIndex});
}

class ButtonLongPressed extends UiEvent {
  int? index;
  ButtonLongPressed({this.index});
}
