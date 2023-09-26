abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  final String? email;
  LoginEmailChanged({this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;
  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}

class LoginStateRefreshed extends LoginEvent {
  String? formStatus;
  LoginStateRefreshed({this.formStatus});
}

class LogOut extends LoginEvent {}
