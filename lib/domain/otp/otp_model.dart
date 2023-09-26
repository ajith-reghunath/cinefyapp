class OtpModel {
  String mobileNumber;

  OtpModel({required this.mobileNumber});

  Map<String, String> toDatabaseJson() => {"phone": mobileNumber};
}
