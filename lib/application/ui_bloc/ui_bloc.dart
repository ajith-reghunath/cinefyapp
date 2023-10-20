import 'package:bloc/bloc.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(UiInitial()) {
    on<IndexChanged>((event, emit) {
      emit(UiState(colorIndex: event.index!));
    });

    on<ProfileIndexChanged>((event, emit) {
      emit(UiState(
          colorIndex: state.colorIndex, profileIndex: event.profileIndex, longpressIndex: state.longpressIndex));
    });

    on<ButtonLongPressed>((event, emit){
      emit(UiState(
          colorIndex: state.colorIndex, profileIndex: state.profileIndex, longpressIndex: event.index!));
    });
  }
}
