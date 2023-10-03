import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cinefy/infrastructure/api_calls/base_client.dart' as bc;
import 'package:http/http.dart' as http;
import 'package:cinefy/domain/get_message/get_message.dart' as gm;

import '../../domain/get_chats/get_chats.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<GetMessage>((event, emit) async {
      http.Response? response = await bc.BaseClient().getMessage(fromID: event.fromID, toID: event.toID);
      if (response != null) {
        var data = jsonDecode(response.body);
        gm.GetMessage getMessage = gm.GetMessage.fromJson(data);
        emit(ChatState(getMessage: getMessage, chatList: state.chatList));
        // print(getMessage.lastMsg.toString());
      } else {
        print('get message response is null');
      }
    });

    on<GetChats>((event, emit) async {
      http.Response? response = await bc.BaseClient().getChats();
      if (response != null) {
        List<GetChat> chatList = [];
        var data = jsonDecode(response.body);
        for (Map<String, dynamic> i in data) {
          chatList.add(GetChat.fromJson(i));
        }
        emit(ChatState(getMessage: state.getMessage, chatList: chatList));
        print('get chats id : ${state.chatList![0].sId}');
      } else {
        print('get chats response is null');
      }
    });
  }
}
