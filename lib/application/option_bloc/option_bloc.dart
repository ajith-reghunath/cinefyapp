import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'option_event.dart';
part 'option_state.dart';

class OptionBloc extends Bloc<OptionEvent, OptionState> {
  OptionBloc() : super(OptionInitial()) {
    on<MaleButtonClicked>((event, emit) {
      emit(OptionState(gender: 'male'));
    });

    on<FemaleButtonClicked>((event, emit) {
      emit(OptionState(gender: 'female'));
    });

    on<OthersButtonClicked>((event, emit) => emit(OptionState(gender: 'others')));
  }
}
