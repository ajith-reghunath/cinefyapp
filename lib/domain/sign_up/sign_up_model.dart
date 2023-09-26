class UserSignUp {
  String email;
  String password;
  String name;
  String phone;
  String type;

  UserSignUp(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone,
      required this.type});

  Map<String, String> toDatabaseJson() => {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "type": type
      };
}