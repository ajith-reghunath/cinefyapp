import 'package:cinefy/application/sign_up_bloc/sign_up_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/sign_up/Enter%20Mobile%20Number/enter_mobile_number_screen.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget userButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return OutlinedButton(
      onPressed: () {
        context.read<SignUpBloc>().add(UserButtonClicked());
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            width: state.type == 'user' ? 2 : 1.5,
            color: state.type == 'user' ? accentColor : shade4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/8.png'),
              radius: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I am an Acting aspirant',
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: fontSize4,
                      color: secondaryColor),
                ),
                Text(
                  'I am here to find casting\ncalls.',
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: fontSize2,
                      color: shade3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}

Widget recruiterButton() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return OutlinedButton(
      onPressed: () {
        context.read<SignUpBloc>().add(RecruiterButtonClicked());
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            width: state.type == 'recruiter' ? 2 : 1.5,
            color: state.type == 'recruiter' ? accentColor : shade4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/7.png'),
              radius: 35,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I am a Casting Director',
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: fontSize4,
                      color: secondaryColor),
                ),
                Text(
                  'I am here to find talented\nartists.',
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: fontSize2,
                      color: shade3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}

Widget chooseYourRoleContinueButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          fixedSize: MaterialStatePropertyAll(
            Size(width, 50),
          ),
          backgroundColor: const MaterialStatePropertyAll(shade1)),
      onPressed: () {
        print(state.email);
        state.type.isNotEmpty
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
                return const EnterMobileNumberScreen();
              }))
            : showSnackBar(context, 'Please select one option');
      },
      child: const Text(
        'Continue',
        style: TextStyle(
            color: primaryColor,
            fontSize: fontSize2,
            fontFamily: 'PoppinsMedium'),
      ),
    );
  });
}

Widget description() {
  return const Text(
    'Choose whether you are an aspiring\nartist or you are a casting director\nor a casting company looking\nfor film aspirants.',
    style: TextStyle(
      fontSize: fontSize2,
      color: shade2,
    ),
    textAlign: TextAlign.center,
  );
}
