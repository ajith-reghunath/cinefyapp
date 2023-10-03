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
import '../../domain/user/loaduser2_model.dart' as loaduser;

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>(
      (event, emit) async {
        print('check : cccccc');
        print((event.response!.body));
        var userData = jsonDecode(event.response!.body);
        UserModel userModel = UserModel.fromJson(userData);

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
      print('length : ${userdetails.length}');
      if (userdetails.isNotEmpty) {
        print('id : ${userdetails[0].id!}');
        Response response = await getUser(userdetails[0].id!);

        var userData = jsonDecode(response.body);
        loaduser.UserModel2 userModel2 = loaduser.UserModel2.fromJson(userData);
        // print(response.body);
        emit(UserState(
          sId: userModel2.sId,
          name: userModel2.profile!.name,
          email: userModel2.email,
          phone: userModel2.phone,
          password: userModel2.password,
          type: userModel2.type,
          isDelete: userModel2.isDelete,
          iV: userModel2.iV,
          roles: userModel2.profile!.roles,
          skills: userModel2.profile!.skills,
          certifications: userModel2.profile!.certifications,
          languages: userModel2.profile!.languages,
          workExp: userModel2.profile!.workExp,
          education: userModel2.profile!.education,
          age: userModel2.profile!.age,
          bio: userModel2.profile!.bio,
          gender: userModel2.profile!.gender,
          intro: userModel2.profile!.intro,
          photo: userModel2.profile!.photo,
          bookmark: userModel2.bookmarks,
        ));
      }
    });

    on<SaveUser>((event, emit) => emit(UserState(name: state.name)));

    on<IsApplied>((event, emit) {
      if (event.applicantsList!.isNotEmpty) {
        for (int i = 0; i < event.applicantsList!.length; i++) {
          if (event.applicantsList![i].user == state.sId) {
            state.isApplied = true;
            break;
          } else {
            state.isApplied = false;
          }
        }
      }
      else{
        state.isApplied = false;
      }
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

    on<RefreshUserState>((event, emit) {
      emit(UserState(
        sId: state.sId,
        name: state.name,
        email: state.email,
        phone: state.phone,
        password: state.password,
        type: state.type,
        isDelete: state.isDelete,
        iV: state.iV,
        roles: state.roles,
        skills: state.skills,
        certifications: state.certifications,
        languages: state.languages,
        workExp: state.workExp,
        education: state.education,
        age: state.age,
        bio: state.bio,
        gender: state.gender,
        intro: state.intro,
        photo: state.photo,
        bookmark: state.bookmark,
      ));
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
}
