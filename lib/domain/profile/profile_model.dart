import 'dart:io';

class ProfileModel {
  String? name;
  String? age;
  String userID;
  List<dynamic>? roles;
  String gender;
  File? photo;
  String cover;
  String bio;
  String intro;
  List<String> skills;
  List<String> certifications;
  List<dynamic>? languages;
  List<String> workExperience;
  List<String> education;

  ProfileModel(
      {this.name,
      this.age,
      required this.userID,
      this.roles,
      required this.gender,
      this.photo,
      required this.cover,
      required this.bio,
      required this.intro,
      required this.skills,
      required this.certifications,
      required this.languages,
      required this.workExperience,
      required this.education});

  Map<String, dynamic> toDatabaseJson() => {
        "name": name,
        "age": age,
        "gender": gender,
        "roles": roles,
        "image": photo,
        "cover": cover,
        "bio": bio,
        "intro": intro,
        "skills": skills,
        "certifications": certifications,
        "languages": languages,
        "workExp": workExperience,
        "education": education
      };
}
