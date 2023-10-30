part of 'sign_up_bloc.dart';

class SignUpState {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String type;
  final String otpEntered;
  String otpStatus;
  Response? signUpResponse;
  Response? otpResponse;
  String signupStatus;

  bool isEmailValid() {
    String emailRegX = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegX).hasMatch(email);
  }

  bool get isPasswordValid => password.length > 5;

  bool get isNameValid => name.isNotEmpty;

  bool get isPhoneValid => phone.length == 10;

  bool get isTypeValid => type.isNotEmpty;

  bool get isOtpEnteredValid => otpEntered.length == 4;

  SignUpState(
      {this.email = '',
      this.password = '',
      this.name = '',
      this.phone = '',
      this.type = '',
      this.otpEntered = '',
      this.signUpResponse,
      this.otpResponse,
      this.otpStatus = 'Initial',
      this.signupStatus='Initial'});

  SignUpState copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    String? type,
    String? otpEntered,
    Response? signUpResponse,
    Response? otpResponse,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      otpEntered: otpEntered ?? this.otpEntered,
      signUpResponse: signUpResponse,
      otpResponse: otpResponse,
    );
  }
}

class SignUpInitial extends SignUpState {}
