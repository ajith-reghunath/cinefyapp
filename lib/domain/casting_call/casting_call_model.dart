import 'package:json_annotation/json_annotation.dart';
part 'casting_call_model.g.dart';

@JsonSerializable()
class CastingCallModel {
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
  Author? author;
  String? updatedAt;
  String? createdAt;
  bool? valid;
  String? castingCallStatus;
  int? index;

  CastingCallModel(
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
      this.valid,
      this.castingCallStatus,
      this.index});

  factory CastingCallModel.fromJson(Map<String, dynamic> json) =>
      _$CastingCallModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastingCallModelToJson(this);
}

@JsonSerializable()
class Applicants {
  String? user;
  String? status;
  String? sId;

  Applicants({this.user, this.status, this.sId});

  factory Applicants.fromJson(Map<String, dynamic> json) =>
      _$ApplicantsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantsToJson(this);
}

@JsonSerializable()
class Author {
  Profile? profile;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? type;
  String? profilePic;
  bool? isDelete;
  int? iV;
  String? phone;

  Author(
      {this.profile,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.type,
      this.profilePic,
      this.isDelete,
      this.iV,
      this.phone});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Profile {
  List? roles;
  List? skills;
  List? certifications;
  List? languages;
  List? workExp;
  List? education;

  Profile(
      {this.roles,
      this.skills,
      this.certifications,
      this.languages,
      this.workExp,
      this.education});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
