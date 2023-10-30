import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/bloc_user/user_event.dart';
import 'package:cinefy/application/sign_up_bloc/sign_up_bloc.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:cinefy/presentation/main_page/cd_mainpage.dart';
import 'package:cinefy/presentation/main_page/screen_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'enter_name_widgets.dart';

class EnterNameScreen extends StatelessWidget {
  const EnterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.15 * height,
              ),
              enterNameForm(width),
              BlocListener<SignUpBloc, SignUpState>(
                listenWhen: (context, state) {
                  return state.signupStatus == 'Success' ||
                      state.signupStatus == 'Failed';
                },
                listener: (context, state) {
                  if (state.signupStatus == 'Success') {
                    context
                        .read<UserBloc>()
                        .add(LoadUser(response: state.signUpResponse));
                  } else if (state.signupStatus == 'Failed') {
                    showSnackBar(context, signUpMessage!);
                    state.signupStatus = '';
                  }
                },
                child: sizedBoxH10(),
              ),
              BlocListener<UserBloc, UserState>(
                listenWhen: (context, state) {
                  return state.userStatus == 'loaded';
                },
                listener: (context, state) {
                  if (state.userStatus == 'loaded') {
                    state.type == 'recruiter'
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return ScreenCastingDirectorMainPage();
                            }),
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return ScreenMainPage();
                            }),
                          );
                  }
                },
                child: sizedBoxH10(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
