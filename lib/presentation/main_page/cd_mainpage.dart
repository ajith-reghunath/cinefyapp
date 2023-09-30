import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/main_page/widgets/cd_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../chat/screen_chat.dart';
import '../create_cc/screen_cc.dart';
import '../home/cd_screen_home.dart';

// ignore: must_be_immutable
class ScreenCastingDirectorMainPage extends StatelessWidget {
  ScreenCastingDirectorMainPage({Key? key}) : super(key: key);
  int call = 1;
  final _pages = [
    ScreenCdHome(),
    const ScreenCreateCastingCall(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        if (call == 1) {
          context.read<CastingCallBloc>().add(LoadCreatedCastingCall());
          call = 0;
        }
        return Scaffold(
          body: Visibility(
            visible: state.createdCastingCallList != null,
            replacement: const Center(
              child: CircularProgressIndicator(
                color: accentColor,
              ),
            ),
            child: ValueListenableBuilder(
                valueListenable: indexChangeNotifier,
                builder: ((context, int value, child) {
                  return _pages[value];
                })),
          ),
          bottomNavigationBar: const CdBottomNav(),
        );
      },
    );
  }
}
