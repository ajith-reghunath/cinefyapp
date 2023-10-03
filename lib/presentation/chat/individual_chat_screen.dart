import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/chat_bloc/chat_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../domain/time_ago/time_display.dart';

class IndividualChatScreen extends StatelessWidget {
  const IndividualChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return Scaffold(
              body: Visibility(
                visible: state.getMessage != null,
                replacement: const Center(child: CircularProgressIndicator(color: accentColor,),),
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                child: Text(
                                  'Abhijith',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 20),
                                ),
                              )
                            ],
                          )),
                    ),
                    Expanded(
                        child: state.getMessage != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: GroupedListView(
                                  reverse: true,
                                  order: GroupedListOrder.DESC,
                                  useStickyGroupSeparators: true,
                                  floatingHeader: true,
                                  elements: state.getMessage!.messages!,
                                  groupBy: (message) =>
                                      TimeDisplay().getTime(message.time!),
                                  groupSeparatorBuilder: (value) =>
                                      const SizedBox(),
                                  groupHeaderBuilder: (element) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      TimeDisplay().getTime(element.time!),
                                      style: const TextStyle(color: accentColor),
                                    ),
                                  ),
                                  itemBuilder: (context, message) => Align(
                                    alignment: message.sender == userState.sId
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 4,horizontal: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: message.sender == userState.sId
                                              ? const Color(0xffc7c9fb)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(7),
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                message.text!,
                                                style:
                                                    const TextStyle(fontSize: 17),
                                              ),
                                              sizedBoxW10(),
                                              const SizedBox(
                                                height: 25,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    '4:00 PM',
                                                    style: TextStyle(
                                                        fontSize: fontSize6,
                                                        color: shade2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              )),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration( color: shade4,borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            const Expanded(
                              child:TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(12),
                                    hintText: 'Type here...'),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.send,color: secondaryColor,))
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
