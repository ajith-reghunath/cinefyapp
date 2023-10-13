part of 'chat_bloc.dart';

class ChatState {
  gm.GetMessage? getMessage;
  String? getMessageStatus;
  List<gm.Messages>? messagesList;
  List<GetChat>? chatList;
  IO.Socket? currentSocket;
  String? receivedMessage;
  ChatState(
      {this.getMessage,
      this.chatList,
      this.getMessageStatus,
      this.currentSocket,
      this.receivedMessage,
      this.messagesList});
}

class ChatInitial extends ChatState {
  ChatInitial();
}
