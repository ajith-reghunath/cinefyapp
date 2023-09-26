import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/presentation/common%20widgets/casting%20call%20card/castingCallCard.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/casting_call/casting_call_model.dart';
import '../castingcall/screen_casting_call.dart';

class ScreenApplied extends StatelessWidget {
  const ScreenApplied({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CastingCallBloc, CastingCallState>(
        builder: (context, state) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              final width = MediaQuery.of(context).size.width;
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
                    // TextButton(
                    //     onPressed: () {
                    //       for (int i = 0;
                    //           i < state.appliedCastingCallList.length;
                    //           i++) {
                    //         print(state.appliedCastingCallList[i].title
                    //             .toString());
                    //       }
                    //     },
                    //     child: Text('click me')),
                    // TextButton(
                    //     onPressed: () {
                    //       context
                    //           .read<CastingCallBloc>()
                    //           .add(AppliedCastingCalls());
                    //     },
                    //     child: Text('load')),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          bool isBookmarked = userState.bookmark!
                              .contains(appliedCastingCallList[index].sId);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return ScreenCastingCall(
                                    index: appliedCastingCallList[index].index!,
                                    isBookmarked: isBookmarked,
                                  );
                                }),
                              );
                            },
                            child: appliedCastingcallCard(
                                context: context,
                                title: appliedCastingCallList[index].title,
                                roles: appliedCastingCallList[index].roles,
                                author:
                                    appliedCastingCallList[index].author!.name,
                                type: appliedCastingCallList[index].projectType,
                                imageUrl:
                                    'https://app.nex-gen.shop/${appliedCastingCallList[index].image}',
                                language: appliedCastingCallList[index]
                                        .language!
                                        .isEmpty
                                    ? 'not given'
                                    : appliedCastingCallList[index]
                                        .language![0]
                                        .toString(),
                                isBookmarked: isBookmarked,
                                castingStatus: appliedCastingCallList[index]
                                    .castingCallStatus),
                          );
                        },
                        itemCount: state.appliedCastingCallList.length,
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