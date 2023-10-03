import 'package:json_annotation/json_annotation.dart';
part 'get_message.g.dart';

@JsonSerializable()
class GetMessage {
  UnRead? unRead;
  String? sId;
  List<String>? users;
  List<Messages>? messages;
  String? lastMsg;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetMessage(
      {this.unRead,
      this.sId,
      this.users,
      this.messages,
      this.lastMsg,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory GetMessage.fromJson(Map<String, dynamic> json) =>
      _$GetMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessageToJson(this);
}

@JsonSerializable()
class UnRead {
  String? id;
  int? count;

  UnRead({this.id, this.count});

  factory UnRead.fromJson(Map<String, dynamic> json) => _$UnReadFromJson(json);

  Map<String, dynamic> toJson() => _$UnReadToJson(this);
}

@JsonSerializable()
class Messages {
  String? text;
  String? sender;
  bool? read;
  String? sId;
  String? time;

  Messages({this.text, this.sender, this.read, this.sId, this.time});

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MessagesToJson(this);
}
