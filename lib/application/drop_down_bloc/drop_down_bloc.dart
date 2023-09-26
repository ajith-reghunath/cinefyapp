import 'package:bloc/bloc.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(DropDownInitial(interests: [], languages: [])) {
    on<Selected>((event, emit) {
      event.listOfValues.add(event.itemValue);
      emit(DropDownState(
          interests: state.interests, languages: state.languages));
      print(state.interests.toString());
    });

    on<DeSelected>((event, emit) {
      event.listOfValues.remove(event.itemValue);
      emit(DropDownState(
          interests: state.interests, languages: state.languages));
      print(state.interests.toString());
    });

    on<DropDownSelected>((event, emit) {
      emit(DropDownState(
          interests: state.interests,
          languages: state.languages,
          selectedProjectType: event.selectedValue,
          selectedLanguageType: state.selectedLanguageType,
          selectedRoleType: state.selectedRoleType));
    });

    on<LanguageDropDownSelected>((event, emit) {
      emit(DropDownState(
          interests: state.interests,
          languages: state.languages,
          selectedProjectType: state.selectedProjectType,
          selectedLanguageType: event.selectedValue,
          selectedRoleType: state.selectedRoleType));
    });

    on<RoleSelected>((event, emit) {
      emit(DropDownState(
          interests: state.interests,
          languages: state.languages,
          selectedLanguageType: state.selectedLanguageType,
          selectedProjectType: state.selectedProjectType,
          selectedRoleType: event.selectedValue));
    });
  }
}
