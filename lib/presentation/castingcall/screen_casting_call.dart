import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/ui_bloc/ui_bloc.dart';
import 'package:cinefy/presentation/castingcall/widgets/screen_casting_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/bloc_user/user_event.dart';
import '../../domain/time_ago/time_display.dart';
import '../common widgets/casting call card/castingCallCard.dart';

// ignore: must_be_immutable
class ScreenCastingCall extends StatelessWidget {
  ScreenCastingCall(
      {super.key, required this.index, required this.isBookmarked});
  int index;
  bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastingCallBloc, CastingCallState>(
        builder: (context, castingCallstate) {
      return BlocBuilder<UiBloc, UiState>(
        builder: (context, uiState) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              print('user id is ${userState.sId}');
              context.read<UserBloc>().add(IsApplied(
                  applicantsList:
                      castingCallstate.castingCallList![index].applicants,
                  id: userState.sId));
              print('user id is ${userState.sId}');
              double width = MediaQuery.of(context).size.width;
              double height = MediaQuery.of(context).size.height;
              return Scaffold(
                body: SafeArea(
                    child: ListView(
                  children: [
                    sizedBoxH10(),
                    backButton(context),
                    castingcallCard(
                        context: context,
                        title: castingCallstate.castingCallList![index].title,
                        roles: castingCallstate.castingCallList![index].roles,
                        author: castingCallstate
                            .castingCallList![index].author!.name,
                        type: castingCallstate
                            .castingCallList![index].projectType,
                        imageUrl:
                            'https://app.nex-gen.shop/${castingCallstate.castingCallList![index].image}',
                        language: castingCallstate
                                .castingCallList![index].language!.isEmpty
                            ? 'not given'
                            : castingCallstate
                                .castingCallList![index].language![0]
                                .toString(),
                        isBookmarked: isBookmarked,
                        time: TimeDisplay().getTime(castingCallstate
                            .castingCallList![index].createdAt!),
                            postID: castingCallstate.castingCallList![index].sId),
                    sizedBoxH20(),
                    options1(width),
                    sizedBox1(),
                    details(width, index),
                    sizedBoxH15(),
                    applyButton(width, height, index),
                    sizedBoxH20()
                    // Expanded(
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: 5,
                    //       itemBuilder: (_, int index) {
                    //         return Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Container(
                    //             width: width,
                    //             height: 200,
                    //             color: Colors.yellow,
                    //             child: Text(index.toString()),
                    //           ),
                    //         );
                    //       }),
                    // ),
                  ],
                )),
              );
            },
          );
        },
      );
    });
  }
}
