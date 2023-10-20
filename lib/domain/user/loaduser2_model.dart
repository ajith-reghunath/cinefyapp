import 'package:json_annotation/json_annotation.dart';
part 'loaduser2_model.g.dart';

@JsonSerializable()
class UserModel2 {
  Profile? profile;
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? type;
  bool? isDelete;
  int? iV;
  List<String>? bookmarks;
  String? profilePic;

  UserModel2(
      {this.profile,
      this.sId,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.type,
      this.isDelete,
      this.iV,
      this.bookmarks,
      this.profilePic});

  factory UserModel2.fromJson(Map<String, dynamic> json) =>
      _$UserModel2FromJson(json);

  Map<String, dynamic> toJson() => _$UserModel2ToJson(this);
}

@JsonSerializable()
class Profile {
  int? age;
  String? name;
  String? gender;
  String? cover;
  String? bio;
  String? intro;
  List<String>? skills;
  List<String>? certifications;
  List<String>? workExp;
  List<String>? education;
  String? photo;
  List<String>? roles;
  List<String>? languages;

  Profile(
      {this.age,
      this.name,
      this.gender,
      this.cover,
      this.bio,
      this.intro,
      this.skills,
      this.certifications,
      this.workExp,
      this.education,
      this.photo,
      this.roles,
      this.languages});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
