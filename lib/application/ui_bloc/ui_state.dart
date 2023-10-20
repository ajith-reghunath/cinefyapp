part of 'ui_bloc.dart';

class UiState {
  int colorIndex;
  int? profileIndex;
  int longpressIndex;
  UiState({this.colorIndex = 1, this.profileIndex, this.longpressIndex=1});
}

class UiInitial extends UiState {}
