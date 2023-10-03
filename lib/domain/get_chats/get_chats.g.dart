// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChat _$GetChatFromJson(Map<String, dynamic> json) => GetChat(
      unRead: json['unRead'] == null
          ? null
          : UnRead.fromJson(json['unRead'] as Map<String, dynamic>),
      sId: json['_id'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMsg: json['lastMsg'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$GetChatToJson(GetChat instance) => <String, dynamic>{
      'unRead': instance.unRead,
      '_id': instance.sId,
      'users': instance.users,
      'messages': instance.messages,
      'lastMsg': instance.lastMsg,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

UnRead _$UnReadFromJson(Map<String, dynamic> json) => UnRead(
      id: json['id'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$UnReadToJson(UnRead instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      sId: json['_id'] as String?,
      name: json['name'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'profilePic': instance.profilePic,
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      text: json['text'] as String?,
      sender: json['sender'] as String?,
      read: json['read'] as bool?,
      sId: json['_id'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'text': instance.text,
      'sender': instance.sender,
      'read': instance.read,
      '_id': instance.sId,
      'time': instance.time,
    };
