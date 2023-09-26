import 'dart:convert';

import 'package:cinefy/core/constants.dart';
import 'package:cinefy/presentation/sign_up/OTP%20Verification/otp_verification_screen.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/sign_up_bloc/sign_up_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/fontSize.dart';

Widget enterMobileNumberForm(double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        mainIcons(width, 'assets/images/9.png'),
        titleText('Enter Mobile Number'),
        sizedBox3(),
        _phoneNumberField(),
        sizedBox5(),
        divider(),
        sizedBoxH50(),
        _generateOtpButton(width)
      ],
    ),
  );
}

Widget _phoneNumberField() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: shade5, borderRadius: BorderRadius.circular(7)),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(Icons.phone),
              prefixIconColor: state.phone.isNotEmpty ? shade2 : shade3,
              focusColor: shade1,
              hintText: 'Mobile Number',
            ),
            onChanged: (value) =>
                context.read<SignUpBloc>().add(PhoneChanged(phone: value)),
          ),
        ),
        phoneNumberValidation()
      ],
    );
  });
}

// Widget _mobileNumberField() {
//   return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
//     return TextFormField(
//       decoration: const InputDecoration(
//         icon: Icon(Icons.phone),
//         hintText: 'Mobile number',
//       ),
//       onChanged: (value) =>
//           context.read<SignUpBloc>().add(PhoneChanged(phone: value)),
//       validator: (value) =>
//           state.isPhoneValid ? null : 'Mobile number is not valid',
//     );
//   });
// }

Widget _generateOtpButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, signUpState) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          fixedSize: MaterialStatePropertyAll(
            Size(width, 50),
          ),
          backgroundColor: const MaterialStatePropertyAll(shade1)),
      onPressed: () {
        print(signUpState.isPhoneValid);
        displayPhoneNumberValidation = true;
        context.read<SignUpBloc>().add(GenerateOtpButtonClicked());
        print(signUpState.email);
        if (signUpState.isPhoneValid) {
          if (signUpState.otpResponse!.statusCode == 200) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return (const OtpVerificationScreen());
              }),
            );
          } else {
            var data = jsonDecode(signUpState.otpResponse!.body.toString());
            showSnackBar(context, data['message']);
          }
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
        }
      },
      child: const Text(
        'Generate OTP',
        style: TextStyle(
            color: primaryColor,
            fontSize: fontSize2,
            fontFamily: 'PoppinsMedium'),
      ),
    );
  });
}

Widget phoneNumberValidation() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    if (displayPhoneNumberValidation == true) {
      return state.isPhoneValid
          ? const Text('')
          : const Text(
              'phone number is not valid',
              style: TextStyle(color: redcolor),
            );
    } else {
      return const Text('');
    }
  });
}
