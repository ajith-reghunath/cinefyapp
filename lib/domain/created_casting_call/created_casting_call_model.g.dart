// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_casting_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedCastingCall _$CreatedCastingCallFromJson(Map<String, dynamic> json) =>
    CreatedCastingCall(
      sId: json['sId'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      shortdescription: json['shortdescription'] as String?,
      image: json['image'] as String?,
      director: json['director'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      age: (json['age'] as List<dynamic>?)?.map((e) => e as int).toList(),
      date: json['date'] as String?,
      description: json['description'] as String?,
      iV: json['iV'] as int?,
      projectType: json['projectType'] as String?,
      gender: json['gender'] as String?,
      language: (json['language'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
      applicants: (json['applicants'] as List<dynamic>?)
          ?.map((e) => Applicants.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: json['author'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      valid: json['valid'] as bool?,
    );

Map<String, dynamic> _$CreatedCastingCallToJson(CreatedCastingCall instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'shortdescription': instance.shortdescription,
      'image': instance.image,
      'director': instance.director,
      'roles': instance.roles,
      'age': instance.age,
      'date': instance.date,
      'description': instance.description,
      'iV': instance.iV,
      'projectType': instance.projectType,
      'gender': instance.gender,
      'language': instance.language,
      'location': instance.location,
      'applicants': instance.applicants,
      'author': instance.author,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'valid': instance.valid,
    };

Applicants _$ApplicantsFromJson(Map<String, dynamic> json) => Applicants(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$ApplicantsToJson(Applicants instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'sId': instance.sId,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'profilePic': instance.profilePic,
    };
