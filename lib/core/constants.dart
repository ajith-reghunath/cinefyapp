import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

// String apiBase = 'http://10.0.2.2:5000/api/';
String apiBase = 'https://app.nex-gen.shop/api/';
final logInFormKey = GlobalKey<FormState>();
final signUpFormKey = GlobalKey<FormState>();
final createNewAccountFormKey = GlobalKey<FormState>();
final phoneNumberFormKey = GlobalKey<FormState>();
final otpVerificationKey = GlobalKey<FormState>();
bool displaySignUpEmailValidation = false;
bool displaySignUpPasswordValidation = false;
bool displayPhoneNumberValidation = false;
bool displayOtpNumberValidation = false;
bool displayNameValidation = false;
bool displayLoginEmailValidation = false;
bool displayLoginPasswordValidation = false;
StreamController<Response> controller = StreamController<Response>.broadcast();
