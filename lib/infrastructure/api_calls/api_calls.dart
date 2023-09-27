import 'package:cinefy/infrastructure/api_calls/base_client.dart' as base_client;

import '../../domain/Login/log_in_model.dart';
import '../../domain/sign_up/sign_up_model.dart';

abstract class ApiRepository {
  Future<dynamic>? userLogin(LoginModel userLogin);
  Future<dynamic>? userSignUp(UserSignUp userSignUp);
}

class ApiCalls extends ApiRepository {
  @override
  Future<dynamic>? userLogin(LoginModel userLogin) async {
    final response =
        await base_client.BaseClient().loginApi('/login', userLogin);
    return response;
  }

  @override
  Future<dynamic>? userSignUp(UserSignUp userSignUp) async {
    final response =
        await base_client.BaseClient().signUpApi('/signup', userSignUp);
    return response;
  }
}
