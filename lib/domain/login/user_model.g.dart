// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      sId: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      type: json['type'] as String?,
      isDelete: json['isDelete'] as bool?,
      iV: json['iV'] as int?,
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'profile': instance.profile,
      '_id': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'type': instance.type,
      'isDelete': instance.isDelete,
      'iV': instance.iV,
      'bookmarks': instance.bookmarks,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      age: json['age'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      cover: json['cover'] as String?,
      bio: json['bio'] as String?,
      intro: json['intro'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      certifications: (json['certifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workExp:
          (json['workExp'] as List<dynamic>?)?.map((e) => e as String).toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photo: json['photo'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'age': instance.age,
      'name': instance.name,
      'gender': instance.gender,
      'cover': instance.cover,
      'bio': instance.bio,
      'intro': instance.intro,
      'skills': instance.skills,
      'certifications': instance.certifications,
      'workExp': instance.workExp,
      'education': instance.education,
      'photo': instance.photo,
      'roles': instance.roles,
      'languages': instance.languages,
    };
