import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cinefy/domain/otp/otp_model.dart';
import 'package:cinefy/infrastructure/api_calls/api_calls.dart';
import 'package:cinefy/infrastructure/api_calls/base_client.dart'
    as base_client;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../core/constants.dart';
import '../../domain/sign_up/sign_up_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password!));
    });

    on<NameChanged>((event, emit) {
      emit(SignUpState(
          name: event.name!,
          otpResponse: state.otpResponse,
          phone: state.phone,
          email: state.email,
          password: state.password,
          type: state.type,
          otpEntered: state.otpEntered));
    });

    on<PhoneChanged>((event, emit) async {
      emit(state.copyWith(
          phone: event.phone!,
          email: state.email,
          password: state.password,
          type: state.type));
      // if (state.phone.length == 10) {
      //   OtpModel otpModel = OtpModel(mobileNumber: state.phone);
      //   Response response = await getOtp(otpModel);
      //   emit(
      //     SignUpState(
      //         otpResponse: response,
      //         phone: event.phone!,
      //         email: state.email,
      //         password: state.password,
      //         type: state.type),
      //   );
      // }
    });

    // on<SignUpClicked>((event, emit) async {
    //   UserSignUp signUpUser = UserSignUp(
    //       email: state.email,
    //       password: state.password,
    //       name: state.name,
    //       phone: state.phone,
    //       type: state.type);
    //   await getSignUpToken(signUpUser);
    //   // emit(SignUpState(response: response));
    // });

    on<CreateNewAccountButtonClicked>((event, emit) {
      emit(
        SignUpState(email: state.email, password: state.password),
      );
    });

    on<UserButtonClicked>((event, emit) async {
      emit(SignUpState(
          type: 'user', email: state.email, password: state.password));
    });

    on<RecruiterButtonClicked>((event, emit) async {
      emit(SignUpState(
          type: 'recruiter', email: state.email, password: state.password));
    });
    on<GenerateOtpButtonInitialized>((event, emit) async {
      emit(SignUpState(
          phone: state.phone,
          email: state.email,
          password: state.password,
          type: state.type,
          otpStatus: 'Initial'));
    });

    on<GenerateOtpButtonClicked>((event, emit) async {
      OtpModel otpModel = OtpModel(mobileNumber: state.phone);
      Response? response =
          await base_client.BaseClient().otpApi('/sendOtp', otpModel);
      if (response != null) {
        emit(
          SignUpState(
              otpResponse: response,
              phone: state.phone,
              email: state.email,
              password: state.password,
              type: state.type,
              otpStatus: 'Success'),
        );
      } else {
        emit(SignUpState(
            phone: state.phone,
            email: state.email,
            password: state.password,
            type: state.type,
            otpStatus: 'Failed'));
      }

      // print('otp response : ${state.otpResponse!.body}');
      // emit(SignUpState(
      //     otpResponse: state.otpResponse,
      //     type: state.type,
      //     email: state.email,
      //     password: state.password,
      //     phone: state.phone));
    });

    on<OtpAdded>((event, emit) async {
      emit(SignUpState(
          otpResponse: state.otpResponse,
          phone: state.phone,
          email: state.email,
          password: state.password,
          type: state.type,
          otpEntered: event.otp!));
    });

    // on<VerifyOtpButtonClicked>((event, emit) async {
    //   UserSignUp signUpUser = UserSignUp(
    //       email: state.email,
    //       password: state.password,
    //       name: state.name,
    //       phone: state.phone,
    //       type: state.type);
    //   await getSignUpToken(signUpUser);
    //   // emit(SignUpState(response: response));
    // });

    on<VerifyotpButtonClickedInitial>((event, emit) => emit(SignUpState(
        otpResponse: state.otpResponse,
        phone: state.phone,
        email: state.email,
        password: state.password,
        type: state.type,
        otpEntered: state.otpEntered)));

    on<FinishSignUpInitial>(
      (event, emit) => emit(
        SignUpState(
            name: state.name,
            otpResponse: state.otpResponse,
            phone: state.phone,
            email: state.email,
            password: state.password,
            type: state.type,
            otpEntered: state.otpEntered,
            signUpResponse: state.signUpResponse),
      ),
    );

    // on<FinishSignUp>((event, emit) async {
    //   UserSignUp signUpUser = UserSignUp(
    //       email: state.email,
    //       password: state.password,
    //       name: state.name,
    //       phone: state.phone,
    //       type: state.type);
    //   Response response = await getSignUpToken(signUpUser);
    //   emit(SignUpState(signUpResponse: response));
    //   controller.add(response);
    // });

    on<FinishSignUp>((event, emit) async {
      UserSignUp signUpUser = UserSignUp(
          email: state.email,
          password: state.password,
          name: state.name,
          phone: state.phone,
          type: state.type);
      Response? response = await ApiCalls().userSignUp(signUpUser);
      if (response != null) {
        emit(SignUpState(signUpResponse: response));
        print('state emitted');
        print("after emitting ${state.signUpResponse!.body}");
        controller.add(response);
      }
    });
  }

  // Future<Response> getSignUpToken1(UserSignUp userSignUp) async {
  //   const signUpEndPoint = '/signup';
  //   final tokenurl = apiBase + signUpEndPoint;

  //   final response = await http.post(Uri.parse(tokenurl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //       body: jsonEncode(userSignUp.toDatabaseJson()));

  //   if (response.statusCode == 200) {
  //     print('successful');
  //     print(response.body);
  //   } else {
  //     print(response.body);
  //   }
  //   return response;
  // }

  Future<Response> getOtp(OtpModel otpModel) async {
    const otpEndPoint = '/sendOtp';
    final otpUrl = apiBase + otpEndPoint;

    final response = await http.post(Uri.parse(otpUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(otpModel.toDatabaseJson()));
    return response;
  }
}
