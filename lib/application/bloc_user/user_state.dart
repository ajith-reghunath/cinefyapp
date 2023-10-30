part of 'user_bloc.dart';

class UserState {
  String? message;
  User? user;
  String? token;
  String? sId;
  String? email;
  String? phone;
  String? password;
  String? type;
  bool? isDelete;
  int? iV;
  String? name;
  int? age;
  String? gender;
  List<dynamic>? roles;
  String? cover;
  String? bio;
  String? intro;
  List<dynamic>? skills;
  List<dynamic>? certifications;
  List<dynamic>? languages;
  List<dynamic>? workExp;
  List<dynamic>? education;
  String? photo;
  bool? isApplied;
  List<int> recommended = [];
  List<dynamic>? bookmark;
  List<CastingCallModel>? appliedCastingCallList;
  String userStatus;

  UserState(
      {this.message,
      this.token,
      this.sId,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.type,
      this.isDelete,
      this.iV,
      this.roles,
      this.skills,
      this.certifications,
      this.languages,
      this.education,
      this.workExp,
      this.age,
      this.bio,
      this.cover,
      this.gender,
      this.intro,
      this.photo,
      this.user,
      this.bookmark,
      this.appliedCastingCallList,
      this.userStatus='initial'});
}

class UserInitial extends UserState {}
