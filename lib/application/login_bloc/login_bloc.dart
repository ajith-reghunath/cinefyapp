import 'dart:convert';

import 'package:cinefy/application/login_bloc/login_event.dart';
import 'package:cinefy/application/login_bloc/login_state.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/domain/Login/log_in_model.dart';
import 'package:cinefy/infrastructure/api_calls/api_calls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../core/constants.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEmailChanged>((event, emit) async {
      emit(state.copyWith(email: event.email));
      // LoginModel firstUser =
      //     LoginModel(email: event.email!, password: state.password);
      // Response response = await getToken(firstUser);
      // print('kkkkkkkk ${response.statusCode}');
      // (response.statusCode == 200)
      //     ? emit(state.copyWith(formStatus: 'Success'))
      //     : emit(state.copyWith(formStatus: 'Failed'));
    });

    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password));
      // LoginModel firstUser =
      //     LoginModel(email: state.email, password: event.password!);
      // Response? response = await ApiCalls().userLogin(firstUser);
      // if (response != null) {
      //   print('kkkkkkkk ${response.statusCode}');
      //   emit(state.copyWith(formStatus: 'Success', response: response));
      // } else {
      //   emit(state.copyWith(formStatus: 'Failed'));
      // }
    });

    on<LoginSubmitted>((event, emit) async {
      emit(LoginState(
          email: state.email, password: state.password, formStatus: 'Loading'));
      LoginModel firstUser =
          LoginModel(email: state.email, password: state.password);
      Response? response = await ApiCalls().userLogin(firstUser);
      if (response != null) {
        emit(state.copyWith(formStatus: 'Success', response: response));
      } else {
        emit(state.copyWith(formStatus: 'Failed'));
      }
      // emit(
      //   LoginState(
      //       email: state.email,
      //       password: state.password,
      //       formStatus: state.formStatus,
      //       response: state.response),
      // );
    });

    on<LogOut>((event, emit) {
      emit(LoginState(email: '', password: '', formStatus: '', response: null));
      displayLoginEmailValidation = false;
      displayLoginPasswordValidation = false;
    });

    on<LoginStateRefreshed>((event, emit) {
      emit(LoginState(
          email: state.email,
          password: state.password,
          formStatus: state.formStatus,
          response: state.response));
    });
    // on<LoginSubmitted>((event, emit) async {
    //   emit(state.copyWith(formStatus: 'Submitted'));

    //   //testing hive
    // });
  }

  Future<Response> getToken(LoginModel userLogin) async {
    const logInendPoint = '/login';
    final tokenURL = apiBase + logInendPoint;

    final response = await http.post(
      Uri.parse(tokenURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(userLogin.toDatabaseJson()),
    );

    if (response.statusCode == 200) {
      print('successful');
    } else {
      print(response.statusCode);
      var data = jsonDecode(response.body.toString());
      logInMessage = data['message'];
      // print(data['message']);
    }
    return response;
  }
}
