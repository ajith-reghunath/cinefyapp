// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casting_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastingCallModel _$CastingCallModelFromJson(Map<String, dynamic> json) =>
    CastingCallModel(
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
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      valid: json['valid'] as bool?,
      castingCallStatus: json['castingCallStatus'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$CastingCallModelToJson(CastingCallModel instance) =>
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
      'castingCallStatus': instance.castingCallStatus,
      'index': instance.index,
    };

Applicants _$ApplicantsFromJson(Map<String, dynamic> json) => Applicants(
      user: json['user'] as String?,
      status: json['status'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$ApplicantsToJson(Applicants instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'sId': instance.sId,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      type: json['type'] as String?,
      profilePic: json['profilePic'] as String?,
      isDelete: json['isDelete'] as bool?,
      iV: json['iV'] as int?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'profile': instance.profile,
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'type': instance.type,
      'profilePic': instance.profilePic,
      'isDelete': instance.isDelete,
      'iV': instance.iV,
      'phone': instance.phone,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      roles: json['roles'] as List<dynamic>?,
      skills: json['skills'] as List<dynamic>?,
      certifications: json['certifications'] as List<dynamic>?,
      languages: json['languages'] as List<dynamic>?,
      workExp: json['workExp'] as List<dynamic>?,
      education: json['education'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'roles': instance.roles,
      'skills': instance.skills,
      'certifications': instance.certifications,
      'languages': instance.languages,
      'workExp': instance.workExp,
      'education': instance.education,
    };
