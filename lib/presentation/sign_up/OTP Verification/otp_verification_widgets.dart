import 'dart:convert';

import 'package:cinefy/core/constants.dart';
import 'package:cinefy/presentation/sign_up/Enter%20Name/enter_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/sign_up_bloc/sign_up_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/fontSize.dart';
import '../../common widgets/common_widgets.dart';

Widget otpVerificationForm(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            mainIcons(width, 'assets/images/4.png'),
            titleText('OTP Code Verification'),
            sizedBox3(),
            description(),
            sizedBox3(),
            _otpVerifyField(),
            sizedBox3(),
            otpNumberValidation(),
            sizedBoxH20(),
            divider(),
            sizedBoxH50(),
            _verifyOtpButton(width)
          ],
        ),
      );
    },
  );
}

Widget _otpNumberField() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Enter otp',
      ),
      onChanged: (value) =>
          context.read<SignUpBloc>().add(OtpAdded(otp: value)),
    );
  });
}

Widget _otpVerifyField() {
  String number = '';
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: shade4),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffEEEEEE)),
            height: 68,
            width: 64,
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    number = number + value;
                  }
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: fontSize4),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: shade4),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffEEEEEE)),
            height: 68,
            width: 64,
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                  number = number + value;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: fontSize4),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: shade4),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffEEEEEE)),
            height: 68,
            width: 64,
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                  number = number + value;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: fontSize4),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: shade4),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffEEEEEE)),
            height: 68,
            width: 64,
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length != 1) {
                    FocusScope.of(context).previousFocus();
                  }
                  context.read<SignUpBloc>().add(OtpAdded(otp: number + value));
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: fontSize4),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          )
        ],
      ),
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       height: 50,
    //       decoration: BoxDecoration(
    //           color: shade5, borderRadius: BorderRadius.circular(7)),
    //       child: TextFormField(
    //         keyboardType: TextInputType.number,
    //         decoration: InputDecoration(
    //           border: InputBorder.none,
    //           enabledBorder: InputBorder.none,
    //           focusedBorder: InputBorder.none,
    //           prefixIcon: const Icon(Icons.lock),
    //           prefixIconColor: state.otpEntered.isNotEmpty ? shade2 : shade3,
    //           focusColor: shade1,
    //           hintText: 'Enter OTP',
    //         ),
    //         onChanged: (value) =>
    //             context.read<SignUpBloc>().add(OtpAdded(otp: value)),
    //       ),
    //     ),
    //     otpNumberValidation()
    //   ],
    // );
  });
}

Widget _verifyOtpButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, signUpState) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          fixedSize: MaterialStatePropertyAll(
            Size(width, 50),
          ),
          backgroundColor: const MaterialStatePropertyAll(shade1)),
      onPressed: () {
        displayOtpNumberValidation = true;
          context.read<SignUpBloc>().add(VerifyotpButtonClickedInitial());
          var data = jsonDecode(signUpState.otpResponse!.body.toString());
          if (data['code'].toString() == signUpState.otpEntered.toString()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return (EnterNameScreen());
              }),
            );
          } else {
            showSnackBar(context, 'Incorrect OTP');
            print(data['message']);
            print(signUpState.otpEntered);
          }

        //IGNORE

        // if (signUpState.response!.statusCode == 200) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (BuildContext context) {
        //       return ScreenMainPage();
        //     }),
        //   );
        // } else {
        //   var data = jsonDecode(signUpState.response!.body.toString());
        //   showSnackBar1(context, data['message']);
        // }
      },
      child: const Text(
        'Verify',
        style: TextStyle(
            color: primaryColor,
            fontSize: fontSize2,
            fontFamily: 'PoppinsMedium'),
      ),
    );
  });
}

Widget otpNumberValidation() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    if (displayOtpNumberValidation == true) {
      return state.isOtpEnteredValid
          ? const Text('')
          : const Text(
              'Otp entered is not valid',
              style: TextStyle(color: redcolor),
            );
    } else {
      return const Text('');
    }
  });
}

Widget description() {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return Text(
        'Code has been send to \n${state.phone}',
        style: TextStyle(
          fontSize: fontSize2,
          color: shade2,
        ),
        textAlign: TextAlign.center,
      );
    },
  );
}
