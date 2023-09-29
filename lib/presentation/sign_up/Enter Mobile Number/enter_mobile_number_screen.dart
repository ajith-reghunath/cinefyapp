import 'package:cinefy/domain/timer/timer_cubit.dart';
import 'package:cinefy/domain/timer/timer_states.dart';
import 'package:cinefy/presentation/sign_up/Enter%20Mobile%20Number/enter_mobile_number_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/sign_up_bloc/sign_up_bloc.dart';
import '../../../core/global_variables.dart';
import '../../common widgets/common_widgets.dart';
import '../OTP Verification/otp_verification_screen.dart';

class EnterMobileNumberScreen extends StatelessWidget {
  const EnterMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, timerState) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  enterMobileNumberForm(width),
                  BlocListener<SignUpBloc, SignUpState>(
                    listenWhen: (context, state) {
                      return state.otpStatus == "Success" ||
                          state.otpStatus == "Failed";
                    },
                    listener: (context, state) {
                      if (state.otpStatus == "Success") {
                        BlocProvider.of<TimerCubit>(context).startTimer(60);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return (const OtpVerificationScreen());
                          }),
                        );
                      } else if (state.otpStatus == "Failed") {
                        showSnackBar(context, snackBarMessage!);
                        state.otpStatus = 'Initial';
                      }
                    },
                    child: const SizedBox(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
