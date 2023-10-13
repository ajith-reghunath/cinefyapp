import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/chat_bloc/chat_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:cinefy/domain/get_message/get_message.dart' as gm;

import '../../domain/time_ago/time_display.dart';

// ignore: must_be_immutable
class IndividualChatScreen extends StatelessWidget {
  IndividualChatScreen(
      {super.key, required this.receiverID, required this.receiverName});
  String receiverID;
  String receiverName;
  int call = 1;
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if (call == 1) {
              state.currentSocket!.on('msg-recieve', (data) {
                gm.Messages newMessage = gm.Messages(
                    text: data['message'],
                    sender: data['from'],
                    time: data['time']);
                context
                    .read<ChatBloc>()
                    .add(AddMessageToChat(message: newMessage));
              });
              call = 0;
            }
            return Scaffold(
              body: Visibility(
                visible: state.getMessageStatus != 'initial',
                replacement: const Center(
                  child: CircularProgressIndicator(
                    color: accentColor,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      color: secondaryColor,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 40, bottom: 15, left: 10, right: 10),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: primaryColor,
                                  )),
                              const CircleAvatar(
                                backgroundColor: primaryColor,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Text(
                                  receiverName,
                                  style: const TextStyle(
                                      color: primaryColor, fontSize: 20),
                                ),
                              )
                            ],
                          )),
                    ),
                    Expanded(
                        child: state.messagesList != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: GroupedListView(
                                  reverse: true,
                                  // shrinkWrap: true,
                                  order: GroupedListOrder.DESC,
                                  useStickyGroupSeparators: true,
                                  floatingHeader: true,
                                  elements: state.messagesList!,
                                  groupBy: (message) =>
                                      TimeDisplay().getDate(message.time!),
                                  groupComparator: (date1, date2) =>
                                      date1.compareTo(date2),
                                  itemComparator: (message1, message2) =>
                                      message1.time!.compareTo(message2.time!),
                                  groupSeparatorBuilder: (value) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  groupHeaderBuilder: (element) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                offset: const Offset(0, 1),
                                                blurRadius: 4),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Center(
                                            child: Text(
                                              TimeDisplay()
                                                  .displayDate(element.time!),
                                              style: const TextStyle(
                                                  color: accentColor,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemBuilder: (context, message) => Align(
                                    alignment: message.sender == userState.sId
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: message.sender == userState.sId
                                              ? const Color(0xffc7c9fb)
                                              : Colors.white,
                                          borderRadius: message.sender ==
                                                  userState.sId
                                              ? const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))
                                              : const BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                offset: const Offset(0, 1),
                                                blurRadius: 4),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                message.text!,
                                                softWrap: true,
                                                style: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                TimeDisplay()
                                                    .displayTime(message.time!),
                                                style: const TextStyle(
                                                    fontSize: fontSize6,
                                                    color: shade3),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text('Begin a chat'),
                              )),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                            color: shade4,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: chatController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(12),
                                    hintText: 'Type here...'),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (chatController.text.isNotEmpty) {
                                    context.read<ChatBloc>().add(AddMessage(
                                        fromID: userState.sId,
                                        toID: receiverID,
                                        message: chatController.text));
                                    gm.Messages newMessage = gm.Messages(
                                        sender: userState.sId,
                                        text: chatController.text,
                                        time: DateTime.now()
                                            .subtract(const Duration(
                                                hours: 5, minutes: 30))
                                            .toString().replaceAll(' ', 'T'));
                                    context.read<ChatBloc>().add(
                                        AddMessageToChat(message: newMessage));
                                    chatController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: secondaryColor,
                                ))
                          ],
                        ),
                      ),
                    )
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
