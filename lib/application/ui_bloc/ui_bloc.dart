import 'package:bloc/bloc.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(UiInitial()) {
    on<IndexChanged>((event, emit) {
      emit(UiState(colorIndex: event.index!));
    });
  }
}
