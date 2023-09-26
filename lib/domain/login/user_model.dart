import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? message;
  User? user;
  String? token;

  UserModel({this.message, this.user, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  Profile? profile;
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? type;
  bool? isDelete;
  int? iV;
  List<Bookmarks>? bookmarks;

  User(
      {this.profile,
      this.sId,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.type,
      this.isDelete,
      this.iV,
      this.bookmarks});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
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

  factory Profile.fromJson(Map<String, dynamic> json)=> _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Bookmarks {
  String? sId;
  String? title;
  String? subtitle;
  String? shortdescription;
  String? image;
  String? director;
  List<String>? roles;
  List<int>? age;
  String? date;
  String? description;
  int? iV;
  String? projectType;
  String? gender;
  List<String>? language;
  String? location;
  List<Applicants>? applicants;
  String? author;
  String? updatedAt;
  String? createdAt;
  bool? valid;

  Bookmarks(
      {this.sId,
      this.title,
      this.subtitle,
      this.shortdescription,
      this.image,
      this.director,
      this.roles,
      this.age,
      this.date,
      this.description,
      this.iV,
      this.projectType,
      this.gender,
      this.language,
      this.location,
      this.applicants,
      this.author,
      this.updatedAt,
      this.createdAt,
      this.valid});

  factory Bookmarks.fromJson(Map<String, dynamic> json) => _$BookmarksFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarksToJson(this);
}

@JsonSerializable()
class Applicants {
  String? user;
  String? status;
  String? sId;

  Applicants({this.user, this.status, this.sId});

  factory Applicants.fromJson(Map<String, dynamic> json) => _$ApplicantsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantsToJson(this);
}
