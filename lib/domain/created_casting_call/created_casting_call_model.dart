import 'package:json_annotation/json_annotation.dart';
part 'created_casting_call_model.g.dart';

@JsonSerializable()
class CreatedCastingCall {
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

  CreatedCastingCall(
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

  factory CreatedCastingCall.fromJson(Map<String, dynamic> json) =>
      _$CreatedCastingCallFromJson(json);


  Map<String, dynamic> toJson()=> _$CreatedCastingCallToJson(this);
}

@JsonSerializable()
class Applicants {
  User? user;
  String? status;
  String? sId;

  Applicants({this.user, this.status, this.sId});

  factory Applicants.fromJson(Map<String, dynamic> json)=>
      _$ApplicantsFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicantsToJson(this);
}

@JsonSerializable()
class User {
  String? sId;
  String? name;
  String? email;
  String? profilePic;

  User({this.sId, this.name, this.email, this.profilePic});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson()=> _$UserToJson(this);
}
