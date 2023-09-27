import 'dart:async';

import 'package:cinefy/application/bloc_user/user_event.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/infrastructure/functions/current_user_functions.dart';
import 'package:cinefy/presentation/login/login_screen.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_time_ago/get_time_ago.dart';

import '../../application/bloc_user/user_bloc.dart';
import '../../domain/time_ago/custom_messages.dart';
import '../../infrastructure/Functions/current_user_functions.dart'
    as userFunctions;
import '../main_page/cd_mainpage.dart';
import '../main_page/screen_main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  void startTimer(BuildContext context) async {
    bool isEmpty = await userFunctions.isUserDataEmpty();
    GetTimeAgo.setCustomLocaleMessages('en', CustomMessages());
    bool isRecruiter = false;
    if (isEmpty == false) {
      isRecruiter = await isCastingDirector();
    }
    Timer(const Duration(seconds: 2), () {
      if (isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return LoginScreen();
          }),
        );
      } else {
        isRecruiter
            ? Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return ScreenCastingDirectorMainPage();
                },
              ))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
                return ScreenMainPage();
              }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    startTimer(context);
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, castingState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            print('xxxx');
            context.read<UserBloc>().add(LoadUserMethod2());
            return Scaffold(
              backgroundColor: secondaryColor,
              body: Center(
                  child: mainIcons(
                      width * 1.5, 'assets/images/cinefy logo 3.png')),
            );
          },
        );
      },
    );
  }
}
