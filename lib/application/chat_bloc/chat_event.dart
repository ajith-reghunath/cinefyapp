part of 'chat_bloc.dart';

class ChatEvent {}

class GetMessage extends ChatEvent {
  String? fromID;
  String? toID;
  GetMessage({this.fromID, this.toID});
}

class GetChats extends ChatEvent {
  String? id;
  GetChats({this.id});
}

class AddMessage extends ChatEvent {
  String? fromID;
  String? toID;
  String? message;
  AddMessage({this.fromID, this.toID, this.message});
}

class ReceiveMessage extends ChatEvent {}

class AddMessageToChat extends ChatEvent {
  gm.Messages message;
  AddMessageToChat({required this.message});
}
