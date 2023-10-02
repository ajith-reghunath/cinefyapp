import 'package:json_annotation/json_annotation.dart';
part 'bookmarked_model.g.dart';

@JsonSerializable()
class UserBookMarked {
  String? message;
  List<Data>? data;

  UserBookMarked({this.message, this.data});

  factory UserBookMarked.fromJson(Map<String, dynamic> json) =>
      _$UserBookMarkedFromJson(json);

  Map<String, dynamic> toJson() => _$UserBookMarkedToJson(this);
}

@JsonSerializable()
class Data {
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

  Data(
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
