part of 'drop_down_bloc.dart';

class DropDownState {
  List<dynamic> interests = [];
  List<dynamic> languages = [];
  String? selectedProjectType;
  String? selectedLanguageType;
  String? selectedRoleType;

  DropDownState({
    required this.interests,
    required this.languages,
    this.selectedProjectType,
    this.selectedLanguageType,
    this.selectedRoleType
  });
}

class DropDownInitial extends DropDownState {
  DropDownInitial({required super.interests, required super.languages});
}
