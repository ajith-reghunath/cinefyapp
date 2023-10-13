import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/presentation/chat/screen_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestChatScreen extends StatelessWidget {
  const TestChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return (ChatScreen1(userID: state.sId!,name: state.name!,senderID: '64e9818923a6a879c7b4e484',));
                          }),
                        );
                      },
                      child: const Text('Send to Manoharan')),
                       TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return (ChatScreen1(userID: state.sId!,name: state.name!,senderID: '651186344a437da2a0bbe830',));
                          }),
                        );
                      },
                      child: const Text('Send to Jacob')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
