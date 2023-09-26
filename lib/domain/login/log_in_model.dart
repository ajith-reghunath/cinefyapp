class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  Map<String, String> toDatabaseJson() =>
      {"email": email, "password": password};
}