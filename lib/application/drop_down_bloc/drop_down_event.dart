part of 'drop_down_bloc.dart';

class DropDownEvent {}

class Selected extends DropDownEvent {
  String itemValue;
  List<dynamic> listOfValues = [];
  Selected({required this.itemValue, required this.listOfValues});
}

class DeSelected extends DropDownEvent {
  String itemValue;
  List<dynamic> listOfValues = [];
  DeSelected({required this.itemValue, required this.listOfValues});
}

class DropDownSelected extends DropDownEvent {
  String? selectedValue;
  DropDownSelected({this.selectedValue});
}

class LanguageDropDownSelected extends DropDownEvent {
  String? selectedValue;
  LanguageDropDownSelected({this.selectedValue});
}

class RoleSelected extends DropDownEvent {
  String? selectedValue;
  RoleSelected({this.selectedValue});
}
