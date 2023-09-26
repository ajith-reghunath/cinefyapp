import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateCcState {
  PlatformFile? pickFile;
  String? title;
  String? subTitle;
  String? shortDescription;
  String? author;
  String? projectType;
  String? director;
  String? gender;
  String? description;
  String? location;
  List<String> roles = [];
  RangeValues? ageRange;
  List<String> languages = [];
  String? submissionStatus;

  CreateCcState(
      {this.pickFile,
      this.title,
      this.subTitle,
      this.shortDescription,
      this.author,
      this.projectType,
      this.director,
      this.gender,
      this.description,
      this.location,
      required this.roles,
      this.ageRange,
      required this.languages,
      this.submissionStatus});
}

class CreateCcInitial extends CreateCcState {
  CreateCcInitial({required super.roles, required super.languages});
}
