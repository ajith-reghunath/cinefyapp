import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_bloc.dart';
import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_state.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/main_page/cd_mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common widgets/common_widgets.dart';
import '../create_cc/screen_cc.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: BlocListener<CreateCcBloc, CreateCcState>(
              listenWhen: (context, state) {
        return state.submissionStatus == 'Failed';
      }, listener: (context, state) {
        showSnackBar(context, createCcMessage!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return const ScreenCreateCastingCall();
          }),
        );
      }, child: Center(
        child:
            BlocBuilder<CreateCcBloc, CreateCcState>(builder: (context, state) {
          if (state.submissionStatus == 'Initial') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainIcons(width, 'assets/images/waiting emoji.png'),
                const Center(
                  child: Text(
                    'Please wait!\n Submission is progressing...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
          } else if (state.submissionStatus == 'Success') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainIcons(width, 'assets/images/success emoji.png'),
                const Center(
                  child: Text(
                    'Hurray!\nSuccefully submitted',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize4,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      indexChangeNotifier = ValueNotifier(0);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ScreenCastingDirectorMainPage();
                      }));
                    },
                    child: const Text(
                      'Go to home',
                      style: TextStyle(color: accentColor, fontSize: fontSize2),
                    ))
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainIcons(width, 'assets/images/failed emoji.png'),
                const Center(
                  child: Text(
                    'Oops!,\nSomething wrong',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize4,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      indexChangeNotifier = ValueNotifier(0);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ScreenCastingDirectorMainPage();
                      }));
                    },
                    child: const Text('Go to home'))
              ],
            );
          }
        }),
      ))),
    );
  }
}
