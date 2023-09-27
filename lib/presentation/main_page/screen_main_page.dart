import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/applied/screen_applied.dart';
import 'package:cinefy/presentation/bookmarks/screen_bookmark.dart';
import 'package:cinefy/presentation/chat/screen_chat.dart';
import 'package:cinefy/presentation/home/screen_home.dart';
import 'package:cinefy/presentation/main_page/widgets/bottom_nav.dart';
import 'package:cinefy/presentation/profile/screen_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinefy/presentation/sign_up/OTP Verification/otp_verification_screen.dart';
import '../../core/colors.dart';

// ignore: must_be_immutable
class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  int call = 1;
  final _pages = [
    ScreenHome(),
    const ScreenBookmark(),
    ScreenApplied(),
    OtpVerificationScreen(),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        if (call == 1) {
          context.read<CastingCallBloc>().add(LoadCastingCall());
          call = 0;
        }
        return Scaffold(
          body: Visibility(
            visible: state.castingCallList != null,
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
          bottomNavigationBar: const BottomNav(),
        );
      },
    );
  }
}
