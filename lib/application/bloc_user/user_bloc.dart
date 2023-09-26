import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cinefy/application/bloc_user/user_event.dart';
import 'package:cinefy/infrastructure/Functions/current_user_functions.dart';
import 'package:cinefy/infrastructure/Models/current_user.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../../core/constants.dart';
import '../../domain/Login/user_model.dart';
import '../../domain/casting_call/casting_call_model.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>(
      (event, emit) async {
        print('check : cccccc');
        print((event.response!.body));
        var userData = jsonDecode(event.response!.body);
        UserModel userModel = await UserModel.fromJson(userData);

        emit(UserState(
            message: userData['message'],
            token: userData['token'],
            sId: userModel.user!.sId,
            name: userModel.user!.profile!.name ?? userModel.user!.name,
            email: userModel.user!.email,
            phone: userModel.user!.phone,
            gender: userModel.user!.profile!.gender,
            password: userModel.user!.password,
            type: userModel.user!.type,
            isDelete: userModel.user!.isDelete,
            iV: userModel.user!.iV,
            roles: userModel.user!.profile!.roles,
            skills: userModel.user!.profile!.skills,
            certifications: userModel.user!.profile!.certifications,
            languages: userModel.user!.profile!.languages,
            workExp: userModel.user!.profile!.workExp,
            education: userModel.user!.profile!.education,
            age: userModel.user!.profile!.age,
            bio: userModel.user!.profile!.bio,
            intro: userModel.user!.profile!.intro,
            photo: userModel.user!.profile!.photo,
            bookmark: userModel.user!.bookmarks));
        CurrentUserModel currentUser = CurrentUserModel(
            userType: userModel.user!.type,
            id: userModel.user!.sId,
            name: userModel.user!.name,
            tokenId: userData['token']);
        await addCurrentUser(currentUser);
      },
    );

    on<LoadUserMethod2>((event, emit) async {
      List<CurrentUserModel> userdetails = await getAllUsers();
      if (userdetails.isNotEmpty) {
        Response response = await getUser(userdetails[0].id!);
        var userData = jsonDecode(response.body);
        // print(response.body);
        emit(
          UserState(
              sId: userData['_id'],
              name: userData['profile']['name'],
              email: userData['email'],
              phone: userData['phone'],
              password: userData['password'],
              type: userData['type'],
              isDelete: userData['isDelete'],
              iV: userData['__v'],
              roles: userData['profile']['roles'],
              skills: userData['profile']['skills'],
              certifications: userData['profile']['certifications'],
              languages: userData['profile']['languages'],
              workExp: userData['profile']['workExp'],
              education: userData['profile']['education'],
              age: userData['profile']['age'],
              bio: userData['profile']['bio'],
              gender: userData['profile']['gender'],
              intro: userData['profile']['intro'],
              photo: userData['profile']['photo'],
              bookmark: userData['bookmarks']),
        );
      }
    });

    on<SaveUser>((event, emit) => emit(UserState(name: state.name)));

    on<IsApplied>((event, emit) {
      // state.isApplied = true;
      if (event.applicantsList != null) {
        for (int i = 0; i < event.applicantsList!.length; i++) {
          if (event.applicantsList![i].user == state.sId) {
            state.isApplied = true;
            break;
          } else {
            state.isApplied = false;
          }
        }
      }
      print(state.isApplied);
    });

    on<RecommendedCastingCalls>((event, emit) async {
      state.recommended.clear();
      if (state.age != null && state.gender != null) {
        for (int i = 0; i < event.castingCallList!.length; i++) {
          int minAge = event.castingCallList![i].age![0];
          int maxAge = event.castingCallList![i].age![0];
          bool isInRange = (minAge <= state.age! && state.age! >= maxAge);

          if (event.castingCallList![i].gender == state.gender && isInRange) {
            state.recommended.add(i);
          }
        }
      }
    });

    on<Bookmark>((event, emit) {
      addBookmark();
    });

    on<UpdateAppliedList>((event, emit) {
      if (event.castingCall!.applicants != null) {
        print(state.sId);
        for (int i = 0; i < event.castingCall!.applicants!.length; i++) {
          print(event.castingCall!.applicants![i].user.toString());
          if (event.castingCall!.applicants![i].user == state.sId) {
            state.appliedCastingCallList!.add(event.castingCall!);
            break;
          }
        }
      }
    });
  }

  Future<Response> getUser(String id) async {
    final logInendPoint = '/getUserDetails?id=$id';
    final tokenURL = apiBase + logInendPoint;

    final response = await http.get(
      Uri.parse(tokenURL),
    );

    if (response.statusCode == 200) {
      print('successful');
    } else {
      print(response.statusCode);
      var data = jsonDecode(response.body.toString());
      print(data['message']);
    }
    return response;
  }

  addBookmark() async {
    const urlEndPoint =
        '/bookmark?id=64e9818923a6a879c7b4e484&user=64b4d61582387c8592a7f962';
    final url = apiBase + urlEndPoint;
    final response = await http.patch(Uri.parse(url));
    print(response.statusCode);
  }
}
