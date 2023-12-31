import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/casting%20call%20card/castingCallCard.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/casting_call/casting_call_model.dart';
import '../../domain/time_ago/time_display.dart';
import '../castingcall/screen_casting_call.dart';

// ignore: must_be_immutable
class ScreenApplied extends StatelessWidget {
  const ScreenApplied({super.key});
  @override
  Widget build(BuildContext context) {
    int call = 1;
    return SafeArea(
      child: BlocBuilder<CastingCallBloc, CastingCallState>(
        builder: (context, state) {
          if (call == 1) {
            context.read<CastingCallBloc>().add(AppliedCastingCalls());
            call = 0;
          }
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              final width = MediaQuery.of(context).size.width;
              final height = MediaQuery.of(context).size.height;
              List<CastingCallModel> appliedCastingCallList =
                  state.appliedCastingCallList;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: width,
                      child: Center(child: screenTitle('Applied Calls')),
                    ),
                    sizedBoxH10(),
                    Visibility(
                      visible: state.appliedCastingCallList.isNotEmpty,
                      replacement: SizedBox(
                        height: 0.7 * height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/no emoji.png',
                              width: 0.7 * width,
                            ),
                            const Text(
                              'You haven\'t applied for\nany casting calls !',
                              style: TextStyle(fontSize: fontSize4),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ScreenCastingCall(
                                      index:
                                          appliedCastingCallList[index].index!,
                                    );
                                  }),
                                );
                              },
                              child: appliedCastingcallCard(
                                  context: context,
                                  title: appliedCastingCallList[index].title,
                                  roles: appliedCastingCallList[index].roles,
                                  author: appliedCastingCallList[index]
                                      .author!
                                      .name,
                                  type:
                                      appliedCastingCallList[index].projectType,
                                  time: TimeDisplay().getTime(
                                      appliedCastingCallList[index].createdAt!),
                                  postID: appliedCastingCallList[index].sId,
                                  imageUrl:
                                      'https://app.nex-gen.shop/${appliedCastingCallList[index].image}',
                                  language: appliedCastingCallList[index]
                                          .language!
                                          .isEmpty
                                      ? 'not given'
                                      : appliedCastingCallList[index]
                                          .language![0]
                                          .toString(),
                                  castingStatus: appliedCastingCallList[index]
                                      .castingCallStatus),
                            );
                          },
                          itemCount: state.appliedCastingCallList.length,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
