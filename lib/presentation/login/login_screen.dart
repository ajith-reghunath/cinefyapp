import 'dart:convert';

import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/presentation/login/login_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc_user/user_event.dart';
import '../../application/login_bloc/login_bloc.dart';
import '../../application/login_bloc/login_state.dart';
import '../../core/global_variables.dart';
import '../main_page/cd_mainpage.dart';
import '../main_page/screen_main_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    loginForm(context),
                    sizedBox1(),
                    donothaveAnAccount(),
                    signUp(context),
                    BlocListener<LoginBloc, LoginState>(
                      listenWhen: (context, state) {
                        return state.formStatus == 'Success' ||
                            state.formStatus == 'Failed';
                      },
                      listener: (context, state) {
                        if (state.formStatus == 'Success') {
                          context
                              .read<UserBloc>()
                              .add(LoadUser(response: state.response));
                          var userData = jsonDecode(state.response!.body);
                          print(userData['user']['type'] == 'recruiter');
                          userData['user']['type'] == 'recruiter'
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ScreenCastingDirectorMainPage();
                                  }),
                                )
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ScreenMainPage();
                                  }),
                                );
                        } else if (state.formStatus == 'Failed') {
                          showSnackBar(context, logInMessage!);
                          state.formStatus = '';
                        }
                      },
                      child: sizedBoxH10(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
