import 'package:http/http.dart';

class LoginState {
  final String email;
  final String password;
  String formStatus;
  Response ? response;

  bool isEmailValid() {
    String emailRegX = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegX).hasMatch(email);
  }

  bool get isPasswordValid => password.length > 5;

  LoginState(
      {this.email = '', this.password = '', this.formStatus = 'Initial', this.response});

  LoginState copyWith({String? email, String? password, String? formStatus, Response ? response}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
        response: response);
  }
}
