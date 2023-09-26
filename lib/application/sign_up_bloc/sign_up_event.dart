part of 'sign_up_bloc.dart';

class SignUpEvent {}

class EmailChanged extends SignUpEvent {
  String? email;
  EmailChanged({this.email});
}

class PasswordChanged extends SignUpEvent {
  String? password;
  PasswordChanged({this.password});
}

class NameChanged extends SignUpEvent {
  String? name;
  NameChanged({this.name});
}

class PhoneChanged extends SignUpEvent {
  String? phone;
  PhoneChanged({this.phone});
}

class SignUpClicked extends SignUpEvent {}

class CreateNewAccountButtonClicked extends SignUpEvent {}

class UserButtonClicked extends SignUpEvent {}

class RecruiterButtonClicked extends SignUpEvent {}

class GenerateOtpButtonClicked extends SignUpEvent {}

class OtpAdded extends SignUpEvent {
  String? otp;
  OtpAdded({this.otp});
}

class VerifyOtpButtonClicked extends SignUpEvent {}

class VerifyotpButtonClickedInitial extends SignUpEvent {}

class FinishSignUpInitial extends SignUpEvent {}

class FinishSignUp extends SignUpEvent {}
