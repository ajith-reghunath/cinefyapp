import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/sign_up/Choose%20your%20role/choose_your_role_screen.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/sign_up_bloc/sign_up_bloc.dart';
import '../../../core/constants.dart';
import '../../login/login_screen.dart';

Widget createNewAccountForm(Key key, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return Form(
    key: key,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          mainIcons(width, 'assets/images/2.png'),
          titleText('Create New Account'),
          sizedBox1(),
          _emailField(),
          sizedBox2(),
          _passwordField(),
          sizedBox3(),
          _createNewAccountButton(width)
        ],
      ),
    ),
  );
}

Widget _emailField() {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: shade5, borderRadius: BorderRadius.circular(7)),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: state.email.isNotEmpty ? shade2 : shade3,
                focusColor: shade1,
                hintText: 'Email',
              ),
              onChanged: (value) =>
                  context.read<SignUpBloc>().add(EmailChanged(email: value)),
            ),
          ),
          emailValidation(),
        ],
      );
    },
  );
}

Widget _passwordField() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: shade5, borderRadius: BorderRadius.circular(7)),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: const Icon(Icons.lock),
              prefixIconColor: state.password.isNotEmpty ? shade2 : shade3,
              focusColor: shade1,
              hintText: 'Password',
            ),
            onChanged: (value) => context
                .read<SignUpBloc>()
                .add(PasswordChanged(password: value)),
          ),
        ),
        passwordValidation()
      ],
    );
  });
}

Widget _createNewAccountButton(double width) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, signUpState) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          fixedSize: MaterialStatePropertyAll(
            Size(width, 50),
          ),
          backgroundColor: const MaterialStatePropertyAll(shade1)),
      onPressed: () {
        displaySignUpEmailValidation = true;
        displaySignUpPasswordValidation = true;
        context.read<SignUpBloc>().add(CreateNewAccountButtonClicked());
        print(signUpState.email);
        if (signUpState.isEmailValid() == true &&
            signUpState.isPasswordValid == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return (const ChooseYourRoleScreen());
            }),
          );
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
        'Sign up',
        style: TextStyle(
            color: primaryColor,
            fontSize: fontSize2,
            fontFamily: 'PoppinsMedium'),
      ),
    );
  });
}

Widget emailValidation() {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      if (displaySignUpEmailValidation == true) {
        return state.isEmailValid()
            ? const Text(' ')
            : const Text(
                'email id is not valid',
                style: TextStyle(color: redcolor),
              );
      } else {
        return const Text('');
      }
    },
  );
}

Widget passwordValidation() {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    if (displaySignUpPasswordValidation == true) {
      return state.isPasswordValid
          ? const Text('')
          : const Text(
              'please enter 6 characters',
              style: TextStyle(color: redcolor),
            );
    } else {
      return const Text('');
    }
  });
}

Widget alreadyhaveAnAccount() {
  return const Text(
    'Already have an account ?',
    style: TextStyle(
        fontSize: fontSize3, color: shade2, fontFamily: 'PoppinsMedium'),
  );
}

Widget signIn(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
          return (LoginScreen());
        }) );
        // Navigator.pop(context);
      },
      child: const Text(
        'Sign in',
        style: TextStyle(
            fontSize: fontSize2,
            color: accentColor,
            fontFamily: 'PoppinsMedium'),
      ));
}
