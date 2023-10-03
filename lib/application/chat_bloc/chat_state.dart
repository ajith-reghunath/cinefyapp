part of 'chat_bloc.dart';

class ChatState {
  gm.GetMessage? getMessage;
  List<GetChat> ? chatList;
  ChatState({this.getMessage,this.chatList});
}

class ChatInitial extends ChatState {
  ChatInitial();
}
