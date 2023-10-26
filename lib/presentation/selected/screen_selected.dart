import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/chat_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/ui_bloc/ui_bloc.dart';
import '../../core/colors.dart';
import '../../core/fontSize.dart';
import '../../domain/created_casting_call/created_casting_call_model.dart';
import '../artist_profile/artist_profile.dart';
import '../chat/individual_chat_screen.dart';
import '../common widgets/common_widgets.dart';

// ignore: must_be_immutable
class ScreenSelected extends StatelessWidget {
  ScreenSelected({super.key, this.title, this.applicantsList});
  List<Applicants>? applicantsList;
  String? title;
  @override
  Widget build(BuildContext context) {
    print('length of the list : ${applicantsList!.length}');
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        return BlocBuilder<UiBloc, UiState>(
          builder: (context, uiState) {
            return BlocBuilder<ChatBloc, ChatState>(
              builder: (context, chatState) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return Scaffold(
                      body: SafeArea(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<CastingCallBloc>()
                                          .add(RemoveFromSortedList());
                                      Navigator.popUntil(
                                          context,
                                          (Route<dynamic> route) =>
                                              route.isFirst);
                                    },
                                    icon: const Icon(Icons.arrow_back)),
                              ),
                              screenTitle(title!),
                              const SizedBox(width: 40)
                            ],
                          ),
                          Expanded(
                            child: Visibility(
                                visible:
                                    state.profileAddedStatus == 'Completed',
                                replacement: const Center(
                                  child: CircularProgressIndicator(
                                    color: accentColor,
                                  ),
                                ),
                                child: applicantsList!.isNotEmpty
                                    ? ListView.builder(
                                        itemBuilder: (context, int index) {
                                          String keyValue =
                                              applicantsList![index].user!.sId!;
                                          return Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GestureDetector(
                                              onTap: () {
                                                context.read<CastingCallBloc>().add(
                                                    ProfileAddingInitialized());
                                                context.read<UiBloc>().add(
                                                    ProfileIndexChanged(
                                                        profileIndex: index));
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder:
                                                      (BuildContext context) {
                                                    return ArtistProfile(
                                                      castingCallIndex: 1,
                                                      applicantsList:
                                                          applicantsList,
                                                      index: index,
                                                      pageTitle: title,
                                                    );
                                                  }),
                                                );
                                              },
                                              child: Container(
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: shade4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15,
                                                        vertical: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage: state
                                                                      .applicants[
                                                                          keyValue]!
                                                                      .profile!
                                                                      .photo ==
                                                                  null
                                                              ? NetworkImage(state
                                                                  .applicants[
                                                                      keyValue]!
                                                                  .profilePic!)
                                                              : NetworkImage(
                                                                  'https://app.nex-gen.shop/dp/${state.applicants[keyValue]!.profile!.photo}'),
                                                          radius: 35,
                                                        ),
                                                        Text(
                                                          applicantsList![index]
                                                              .user!
                                                              .name!,
                                                          style: const TextStyle(
                                                              fontSize:
                                                                  fontSize4),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      ChatBloc>()
                                                                  .add(
                                                                      GetMessage(
                                                                    fromID:
                                                                        userState
                                                                            .sId,
                                                                    toID: state
                                                                        .applicants[
                                                                            keyValue]!
                                                                        .sId!,
                                                                  ));
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return (IndividualChatScreen(
                                                                    receiverID: state
                                                                        .applicants[
                                                                            keyValue]!
                                                                        .sId!,
                                                                    receiverName: state
                                                                        .applicants[
                                                                            keyValue]!
                                                                        .profile!
                                                                        .name!,
                                                                  ));
                                                                }),
                                                              );
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .chat_outlined,
                                                              size: 30,
                                                            ))
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          );
                                        },
                                        itemCount: applicantsList!.length)
                                    : Center(
                                        child: SizedBox(
                                          height: height * 0.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/empty.png',
                                                width: 0.7 * width,
                                              ),
                                              const Text(
                                                'This folder is empty !',
                                                style: TextStyle(
                                                    fontSize: fontSize4),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                          )
                        ],
                      )),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
  // const ScreenSelected({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<CastingCallBloc, CastingCallState>(
  //     builder: (context, state) {
  //       return Scaffold(
  //         body: SafeArea(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 10),
  //                 child: IconButton(
  //                     onPressed: () {
  //                       context
  //                           .read<CastingCallBloc>()
  //                           .add(RemoveFromSortedList());
  //                       Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
  //                     },
  //                     icon: const Icon(Icons.arrow_back)),
  //               ),
  //               screenTitle('Selected Profiles'),
  //               const SizedBox(width: 40)
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
