import 'package:cinefy/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/bloc_user/user_bloc.dart';
import '../../../application/sign_up_bloc/sign_up_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/fontSize.dart';
import '../../common widgets/common_widgets.dart';

Widget enterNameForm(double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        mainIcons(width, 'assets/images/9.png'),
        titleText('Enter Your Name'),
        sizedBox3(),
        _nameField(),
        sizedBox5(),
        divider(),
        sizedBoxH50(),
        _finishSetUpButton(width)
      ],
    ),
  );
}

Widget _nameField() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: shade5, borderRadius: BorderRadius.circular(7)),
          child: TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: state.name.isNotEmpty ? shade2 : shade3,
              focusColor: shade1,
              hintText: 'Enter your name',
            ),
            onChanged: (value) =>
                context.read<SignUpBloc>().add(NameChanged(name: value)),
          ),
        ),
        nameValidation()
      ],
    );
  });
}

Widget _finishSetUpButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, signUpState) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return signUpState.signupStatus == 'Loading'||signUpState.signupStatus =='Success'? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              ) : ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              fixedSize: MaterialStatePropertyAll(
                Size(width, 50),
              ),
              backgroundColor: const MaterialStatePropertyAll(shade1)),
          onPressed: () async {
            displayNameValidation = true;
            context.read<SignUpBloc>().add(FinishSignUpInitial());

            if (signUpState.isNameValid) {
              context.read<SignUpBloc>().add(FinishSignUp());
            }
          },
          child: const Text(
            'Finish Sign Up',
            style: TextStyle(
                color: primaryColor,
                fontSize: fontSize2,
                fontFamily: 'PoppinsMedium'),
          ),
        );
      },
    );
  });
}

Widget nameValidation() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    if (displayNameValidation == true) {
      return state.isNameValid
          ? const Text('')
          : const Text(
              'please enter minimum of two characters',
              style: TextStyle(color: redcolor),
            );
    } else {
      return const Text('');
    }
  });
}
