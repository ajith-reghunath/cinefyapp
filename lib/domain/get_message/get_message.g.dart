// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessage _$GetMessageFromJson(Map<String, dynamic> json) => GetMessage(
      unRead: json['unRead'] == null
          ? null
          : UnRead.fromJson(json['unRead'] as Map<String, dynamic>),
      sId: json['_id'] as String?,
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMsg: json['lastMsg'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$GetMessageToJson(GetMessage instance) =>
    <String, dynamic>{
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
