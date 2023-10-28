

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class SocketIoFunctions {
  socket_io.Socket? socket;

  Future<socket_io.Socket?> connectToServer(String userID) async {
    socket = socket_io.io('https://app.nex-gen.shop/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    if (socket != null) {
      socket!.connect();
      socket!.emit('add-user', userID);
      print('socket successfully connected');
      return socket;
    } else {
      print('socket is empty');
      return null;
    }
  }

  dynamic receiveMessage(socket_io.Socket? currentSocket) {
    print('receiveMessage worked');
    if (currentSocket != null) {
      currentSocket.on('msg-recieve', (data) {
        print(data.toString());
        return data;
      });
    }
  }

  void sendMessage(
      {socket_io.Socket? currentSocket,
      String? fromID,
      String? toID,
      String? message}) {
    String time = DateTime.now().subtract(const Duration(hours: 5,minutes: 30)).toString();
    String convertedTime = time.replaceFirst(' ', 'T');
    if (currentSocket != null) {
      currentSocket.emit('send-msg', {
        'from': fromID,
        'to': toID,
        'message': message,
        'time': convertedTime
      });
    }
  }
}
