part of 'chat_bloc.dart';

class ChatEvent {}

class GetMessage extends ChatEvent {
  String? fromID;
  String? toID;
  GetMessage({this.fromID, this.toID});
}

class GetChats extends ChatEvent {}
