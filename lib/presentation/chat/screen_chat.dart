import 'dart:convert';

import 'package:cinefy/domain/message_model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    connectToServer();
  }

  void connectToServer() async {
    socket = IO.io('https://app.nex-gen.shop/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    if (socket != null) {
      socket!.connect();
      socket!.emit('add-user', json.encode('64e9818923a6a879c7b4e484'));
      socket!.on('msg-recieve', (data) {
        setState(() {
          messages.add(data);
        });
      });
    } else {
      print('socket is empty');
    }
  }

  void sendMessage() {
    String message = messageController.text.trim();
    if (socket != null) {
      socket!.emit('send-msg', {
        'from': '64e9818923a6a879c7b4e484',
        'to': '64be578400ae57be46dfbf86',
        'message': 'hai mahan',
        'time': '2023-09-30T12:10:39.179Z'
      });
    }
    setState(() {
      messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Socket.IO Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
