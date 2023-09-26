import 'package:hive/hive.dart';
part 'current_user.g.dart';

@HiveType(typeId: 1)
class CurrentUserModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(3)
  String? tokenId;
  @HiveField(4)
  String? userType;

  CurrentUserModel({this.id, this.name, this.tokenId, this.userType});
}
