import 'package:cinefy/infrastructure/Models/current_user.dart';
import 'package:hive/hive.dart';

Future<void> addCurrentUser(CurrentUserModel value) async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');
  await currentUserDB.add(value);
  print('user added');
}

Future<List<CurrentUserModel>> getAllUsers() async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');
  return currentUserDB.values.toList();
}

Future<void> clearUserData() async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');
  await currentUserDB.clear();
}

Future<bool> isUserDataEmpty() async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');
  return currentUserDB.isEmpty;
}

Future<bool> isCastingDirector() async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');
  final currentUser = currentUserDB.getAt(0);
  return (currentUser!.userType=='recruiter');
}

Future<CurrentUserModel?> displayUserData() async {
  final currentUserDB = await Hive.openBox<CurrentUserModel>('current_user');

  // Replace 0 with the actual index of the item you want to retrieve
  final currentUser = currentUserDB.getAt(0);

  if (currentUser != null) {
    return currentUser;
  } else {
    return null;
  }
}
