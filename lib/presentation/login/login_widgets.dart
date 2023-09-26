import 'package:cinefy/application/login_bloc/login_bloc.dart';
import 'package:cinefy/application/login_bloc/login_event.dart';
import 'package:cinefy/application/login_bloc/login_state.dart';
import 'package:cinefy/application/sign_up_bloc/sign_up_bloc.dart';
import 'package:cinefy/presentation/sign_up/Create%20new%20account/create_new_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc_user/user_bloc.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/fontSize.dart';
import '../common widgets/common_widgets.dart';

Widget _emailField() {
  return BlocBuilder<LoginBloc, LoginState>(
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
              onChanged: (value) => context
                  .read<LoginBloc>()
                  .add(LoginEmailChanged(email: value)),
            ),
          ),
          emailValidation(),
        ],
      );
    },
  );
}

Widget _passwordField() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
                .read<LoginBloc>()
                .add(LoginPasswordChanged(password: value)),
          ),
        ),
        passwordValidation()
      ],
    );
  });
}

Widget _loginButton(double width) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, loginState) {
      return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
        return loginState.formStatus == 'Loading'
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              )
            : ElevatedButton(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    fixedSize: MaterialStatePropertyAll(
                      Size(width, 50),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(shade1)),
                onPressed: () {
                  displayLoginEmailValidation = true;
                  displayLoginPasswordValidation = true;
                  context.read<LoginBloc>().add(LoginStateRefreshed());
                  if (loginState.isEmailValid() == true &&
                      loginState.isPasswordValid == true) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                child: const Text('LOG IN'),
              );
      });
    },
  );
}

Widget loginForm(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            mainIcons(width, 'assets/images/1.png'),
            titleText('Log in to Your Account'),
            sizedBox1(),
            _emailField(),
            sizedBox2(),
            _passwordField(),
            sizedBox3(),
            _loginButton(width),
            // SizedBox(
            //     width: 100,
            //     height: 50,
            //     child: TextButton(
            //         onPressed: () {
            //           context.read<LoginBloc>().add(LoginSubmitted());
            //         },
            //         child: (state.formStatus == 'Loading'
            //             ? CircularProgressIndicator()
            //             : const Text('test')))),
          ],
        ),
      );
    },
  );
}

Widget emailValidation() {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      if (displayLoginEmailValidation == true) {
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
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    if (displayLoginPasswordValidation == true) {
      return state.isPasswordValid
          ? const Text('')
          : const Text(
              'password is not valid',
              style: TextStyle(color: redcolor),
            );
    } else {
      return const Text('');
    }
  });
}

Widget donothaveAnAccount() {
  return const Text(
    'Don\'t have an account ?',
    style: TextStyle(
        fontSize: fontSize3, color: shade2, fontFamily: 'PoppinsMedium'),
  );
}

Widget signUp(BuildContext context) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return TextButton(
              onPressed: () async {
                // context.read<SignUpBloc>().add(FinishSignUpTest());
                // Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return (const CreateNewAccountScreen());
                }));
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                    fontSize: fontSize2,
                    color: accentColor,
                    fontFamily: 'PoppinsMedium'),
              ));
        },
      );
    },
  );
}
