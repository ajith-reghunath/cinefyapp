import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: must_be_immutable
class ChatScreen1 extends StatefulWidget {
  ChatScreen1({super.key, required this.userID, required this.name, required this.senderID});
  String userID;
  String name;
  String senderID;
  @override
  _ChatScreen1State createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {
  late IO.Socket socket;
  TextEditingController messageController = TextEditingController();
  String message = 'No message';

  sendMessage() {
    socket.emit('send-msg', {
      'from': widget.userID,
      'to': widget.senderID,
      'message': 'Hello Manoharan',
      'time': DateTime.now().toString()
    });
  }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.on('msg-recieve', (data) {
      print('msg-recieve worked');
      setState(() {
        message = data.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    socket = IO.io('https://app.nex-gen.shop/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
    socket.emit('add-user', widget.userID);
    print('socket 1 : ${socket.id}');
    connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Flutter Socket.IO Chat'),
      ),
      body: Column(
        children: [
          Text('Hi ${widget.name} to ${widget.senderID}'),
          Text(message),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
