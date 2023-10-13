import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cinefy/infrastructure/api_calls/base_client.dart' as bc;
import 'package:http/http.dart' as http;
import 'package:cinefy/domain/get_message/get_message.dart' as gm;
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../domain/get_chats/get_chats.dart';
import '../../infrastructure/socket_io/socket_io_functions.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    // IO.Socket? socket;
    // socket = IO.io('https://app.nex-gen.shop/', <String, dynamic>{
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    // });

    // socket.connect();
    // socket.emit('add-user', json.encode('64e9818923a6a879c7b4e484'));
    // socket.on('msg-recieve', (data) {
    //   print('xxxxxxxxxxx ${data.toString()} xxxxxxxxxxx');
    // });

    print('yyyyyyyyyyyyyyyyyy');

    on<GetMessage>((event, emit) async {
      IO.Socket? currentSocket =
          await SocketIoFunctions().connectToServer(event.fromID!);
      emit(ChatState(
          getMessage: state.getMessage,
          chatList: state.chatList,
          getMessageStatus: 'initial',
          currentSocket: currentSocket));
      http.Response? response = await bc.BaseClient()
          .getMessage(fromID: event.fromID, toID: event.toID);
      if (response != null) {
        if (response.body == 'null') {
          emit(ChatState(
              getMessage: state.getMessage,
              chatList: state.chatList,
              getMessageStatus: 'noData',
              currentSocket: state.currentSocket));
        } else {
          var data = jsonDecode(response.body);
          gm.GetMessage getMessage = gm.GetMessage.fromJson(data);
          emit(ChatState(
              messagesList: getMessage.messages,
              getMessage: getMessage,
              chatList: state.chatList,
              getMessageStatus: 'haveData',
              currentSocket: currentSocket));
        }
      } else {
        print('get message response is null');
      }
    });

    on<GetChats>((event, emit) async {
      emit(ChatState(getMessage: state.getMessage, chatList: state.chatList));
      http.Response? response = await bc.BaseClient().getChats(event.id!);
      if (response != null) {
        List<GetChat> chatList = [];
        var data = jsonDecode(response.body);
        for (Map<String, dynamic> i in data) {
          chatList.add(GetChat.fromJson(i));
        }
        emit(ChatState(getMessage: state.getMessage, chatList: chatList));
        // print('get chats id : ${state.chatList![0].sId}');
      } else {
        print('get chats response is null');
      }
    });

    on<AddMessage>((event, emit) async {
      SocketIoFunctions().sendMessage(
          fromID: event.fromID,
          toID: event.toID,
          message: event.message,
          currentSocket: state.currentSocket);
      http.Response? response = await bc.BaseClient().addMessagetoDB(
          fromID: event.fromID, toID: event.toID, message: event.message);
      if (response != null) {
        if (response.statusCode == 200) {
          print('chat added successfully');
        }
      } else {
        print('get chats response is null');
      }
    });

    on<ReceiveMessage>((event, emit) {
      SocketIoFunctions().receiveMessage(state.currentSocket);
    });

    on<AddMessageToChat>((event, emit) {
      List<gm.Messages>? newMessageList = state.messagesList;
      newMessageList!.add(event.message);

      emit(ChatState(
          messagesList: newMessageList,
          getMessage: state.getMessage,
          chatList: state.chatList,
          getMessageStatus: 'haveData',
          currentSocket: state.currentSocket));
    });
  }
}
