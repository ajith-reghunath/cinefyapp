import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/bloc_user/user_event.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/chat_bloc/chat_bloc.dart';
import 'package:cinefy/application/login_bloc/login_bloc.dart';
import 'package:cinefy/application/login_bloc/login_state.dart';
import 'package:cinefy/presentation/side_menu/about_us_screen.dart';
import 'package:cinefy/presentation/side_menu/privacy_screen.dart';
import 'package:cinefy/presentation/side_menu/t&c_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/login_bloc/login_event.dart';
import '../../../core/colors.dart';
import '../../../core/fontSize.dart';
import '../../../domain/time_ago/time_display.dart';
import '../../../infrastructure/Functions/current_user_functions.dart';
import '../../castingcall/screen_casting_call.dart';
import '../../common widgets/casting call card/castingCallCard.dart';
import '../../common widgets/common_widgets.dart';
import '../../login/login_screen.dart';

Widget topSection(String name, double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 60,
          child: Stack(
            children: [
              const Text(
                'Hello',
                style: TextStyle(
                    fontSize: fontSize1,
                    color: shade2,
                    fontFamily: 'PoppinsMedium'),
              ),
              Positioned(
                top: 22,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 26,
                      color: accentColor,
                      fontFamily: 'PoppinsMedium'),
                ),
              )
            ],
          ),
        ),
        sizedBoxH20(),
      ],
    ),
  );
}

Widget recommended(double width, List<int> recommended) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, userState) {
      return BlocBuilder<CastingCallBloc, CastingCallState>(
        builder: (context, castingCallstate) {
          return recommended.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Recommended casting calls',
                        style: TextStyle(
                            fontSize: 20,
                            color: shade2,
                            fontFamily: 'PoppinsMedium'),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommended.length,
                        itemBuilder: (BuildContext context, int num) {
                          int index = recommended.length - (num + 1);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return ScreenCastingCall(
                                    index: recommended[index],
                                  );
                                }),
                              );
                            },
                            child: recommendedCastingcallCard(
                                width: width * 0.8,
                                context: context,
                                title: castingCallstate
                                    .castingCallList![recommended[index]].title,
                                roles: castingCallstate
                                    .castingCallList![recommended[index]].roles,
                                author: castingCallstate
                                    .castingCallList![recommended[index]]
                                    .author!
                                    .name,
                                type: castingCallstate
                                    .castingCallList![recommended[index]]
                                    .projectType,
                                imageUrl:
                                    'https://app.nex-gen.shop/${castingCallstate.castingCallList![recommended[index]].image}',
                                language: castingCallstate
                                        .castingCallList![recommended[index]]
                                        .language!
                                        .isEmpty
                                    ? 'not given'
                                    : castingCallstate
                                        .castingCallList![recommended[index]]
                                        .language![0]
                                        .toString(),
                                time: TimeDisplay().getTime(castingCallstate
                                    .castingCallList![recommended[index]]
                                    .createdAt!),
                                postID: castingCallstate
                                    .castingCallList![recommended[index]].sId),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox(height: 1);
        },
      );
    },
  );
}

Widget recentCastingCall() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      children: [
        sizedBoxH15(),
        const Text(
          'Recent casting calls',
          style: TextStyle(
              fontSize: 20, color: shade2, fontFamily: 'PoppinsMedium'),
        ),
      ],
    ),
  );
}

Future<dynamic> options(BuildContext context1) {
  double height = MediaQuery.of(context1).size.height;
  double width = MediaQuery.of(context1).size.width;
  return showModalBottomSheet(
      context: context1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0), // Adjust the top radius as needed
      )),
      builder: (BuildContext context) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return BlocBuilder<ChatBloc, ChatState>(
              builder: (context, chatState) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return SizedBox(
                      height: 0.3 * height,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: const MaterialStatePropertyAll(
                                    secondaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                context.read<LoginBloc>().add(LogOut());
                                context.read<UserBloc>().add(UserLoggedOut());
                                Navigator.pop(context1);
                                Navigator.pushReplacement(
                                  context1,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return (LoginScreen());
                                  }),
                                );
                                await clearUserData();
                              },
                              child: SizedBox(
                                width: width,
                                child: const Center(
                                  child: Text(
                                    'Log out',
                                    style: TextStyle(
                                        fontSize: fontSize2,
                                        color: primaryColor),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return TermsAndConditionsScreen();
                                }));
                              },
                              child: const Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                    fontSize: fontSize2, color: secondaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                               Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return AboutUsScreen();
                                }));
                              },
                              child: const Text(
                                'About Us',
                                style: TextStyle(
                                    fontSize: fontSize2, color: secondaryColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return PrivacyScreen();
                                }));
                              },
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: fontSize2, color: secondaryColor),
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
          },
        );
      });
}
