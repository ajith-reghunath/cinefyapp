import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/chat/individual_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/chat_bloc/chat_bloc.dart';
import '../common widgets/common_widgets.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  int call = 1;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if (call == 1) {
              context.read<ChatBloc>().add(GetChats());
              call = 0;
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      child: Center(child: screenTitle('Messages')),
                    ),
                    sizedBox1(),
                    Visibility(
                      visible: state.chatList != null,
                      replacement: SizedBox(
                        height: 0.8*height,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: accentColor,
                          ),
                        ),
                      ),
                      child: Expanded(
                        child: state.chatList == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<ChatBloc>().add(GetMessage(
                                          fromID: state
                                              .chatList![index].users![1].sId,
                                          toID: state
                                              .chatList![index].users![0].sId));
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return (const IndividualChatScreen());
                                        }),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: shade4),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        width: width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 14),
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                backgroundColor: shade4,
                                                radius: 30,
                                              ),
                                              sizedBoxW20(),
                                              Container(
                                                width: width * 0.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state.chatList![index]
                                                          .users![0].name!,
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'PoppinsMedium',
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      state.chatList![index]
                                                          .lastMsg!,
                                                      style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: fontSize5,
                                                          color: shade3),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              sizedBoxW20(),
                                              CircleAvatar(
                                                backgroundColor: accentColor,
                                                radius: 12,
                                                child: Text(
                                                  state.chatList![index].unRead!
                                                              .id ==
                                                          userState.sId
                                                      ? state.chatList![index]
                                                          .unRead!.count
                                                          .toString()
                                                      : '0',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 1,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
