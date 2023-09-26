import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/presentation/castingcall/widgets/screen_casting_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../castingcall/screen_casting_call.dart';
import '../common widgets/casting call card/castingCallCard.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    backButton(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: shade5,
                            borderRadius: BorderRadius.circular(7)),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              // prefixIconColor: state.email.isNotEmpty ? shade2 : shade3,
                              focusColor: shade1,
                              hintText: 'Search here',
                            ),
                            onChanged: (value) {
                              context
                                  .read<CastingCallBloc>()
                                  .add(SearchCastingCall(text: value));
                            }

                            // context.read<SignUpBloc>().add(EmailChanged(email: value)),
                            ),
                      ),
                    ),
                    Expanded(
                        child: state.searchCastingCallList != null
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  bool isBookmarked = userState.bookmark!
                                      .contains(state
                                          .searchCastingCallList![index].sId);
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                          return ScreenCastingCall(
                                            index: index,
                                            isBookmarked: isBookmarked,
                                          );
                                        }),
                                      );
                                    },
                                    child: castingcallCard(
                                        context: context,
                                        title: state
                                            .searchCastingCallList![index]
                                            .title,
                                        roles: state
                                            .searchCastingCallList![index]
                                            .roles,
                                        author: state
                                            .searchCastingCallList![index]
                                            .author!
                                            .name,
                                        type: state
                                            .searchCastingCallList![index]
                                            .projectType,
                                        imageUrl:
                                            'https://app.nex-gen.shop/${state.searchCastingCallList![index].image}',
                                        language: state
                                                .searchCastingCallList![index]
                                                .language!
                                                .isEmpty
                                            ? 'not given'
                                            : state
                                                .searchCastingCallList![index]
                                                .language![0]
                                                .toString(),
                                        isBookmarked: isBookmarked),
                                  );
                                },
                                itemCount: state.searchCastingCallList!.length,
                              )
                            : SizedBox(
                                height: 0.7 * height,
                                child: const Center(child: Text('No data'))))
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
