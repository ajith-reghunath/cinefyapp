import 'package:bloc/bloc.dart';
import 'package:cinefy/domain/created_casting_call/created_casting_call_model.dart';
import 'package:cinefy/domain/user/loaduser2_model.dart';
import 'dart:convert';

import '../../core/constants.dart';
import '../../domain/casting_call/casting_call_model.dart' as ccm;
import 'package:http/http.dart' as http;
import 'package:cinefy/infrastructure/api_calls/base_client.dart' as bc;

import '../../infrastructure/Functions/current_user_functions.dart';
import '../../infrastructure/Models/current_user.dart';

part 'casting_call_event.dart';
part 'casting_call_state.dart';

class CastingCallBloc extends Bloc<CastingCallEvent, CastingCallState> {
  CastingCallBloc()
      : super(CastingCallInitial(
          applicants: {},
          appliedCastingCallList: [],
          rejectedApplicants: [],
          selectedApplicants: [],
          unreviewedApplicants: [],
          bookmarkedApplicants: [],
          reviewedApplicants: [],
        )) {
    on<LoadCastingCall>((event, emit) async {
      ccm.CastingCallModel castingCallModel = ccm.CastingCallModel();
      List<ccm.CastingCallModel> castingCallList =
          await getCastingCalls(castingCallModel);
      emit(CastingCallState(
          castingCallList: castingCallList,
          applicants: state.applicants,
          appliedCastingCallList: state.appliedCastingCallList,
          rejectedApplicants: state.rejectedApplicants,
          selectedApplicants: state.selectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList));
    });

    on<ApplyCastingCall>((event, emit) async {
      List<CurrentUserModel> userdetails = await getAllUsers();
      await applyCastingCall(userdetails[0].id!, event.postID);
      ccm.CastingCallModel castingCallModel = ccm.CastingCallModel();
      List<ccm.CastingCallModel> castingCallList =
          await getCastingCalls(castingCallModel);
      emit(CastingCallState(
          castingCallList: castingCallList,
          applicants: state.applicants,
          appliedCastingCallList: state.appliedCastingCallList,
          rejectedApplicants: state.rejectedApplicants,
          selectedApplicants: state.selectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList));
    });

    on<AppliedCastingCalls>((event, emit) async {
      state.appliedCastingCallList.clear();
      List<CurrentUserModel> userdetails = await getAllUsers();
      if (userdetails.isNotEmpty) {
        String userID = userdetails[0].id!;
        if (state.castingCallList != null) {
          List<ccm.CastingCallModel>? castingCallList = state.castingCallList;
      
          for (int i = 0; i < castingCallList!.length; i++) {
            if (castingCallList[i].applicants!.isNotEmpty) {
              for (int j = 0; j < castingCallList[i].applicants!.length; j++) {
                if (castingCallList[i].applicants![j].user == userID) {
                  state.appliedCastingCallList.add(castingCallList[i]);
                  castingCallList[i].castingCallStatus =
                      castingCallList[i].applicants![j].status;
                  castingCallList[i].index = i;
                  break;
                }
              }
            }
          }
          emit(CastingCallState(
              castingCallList: state.castingCallList,
              appliedCastingCallList: state.appliedCastingCallList,
              rejectedApplicants: state.rejectedApplicants,
              applicants: state.applicants,
              selectedApplicants: state.selectedApplicants,
              unreviewedApplicants: state.unreviewedApplicants,
              bookmarkedApplicants: state.bookmarkedApplicants,
              reviewedApplicants: state.reviewedApplicants,
              createdCastingCallList: state.createdCastingCallList));
        }
      }
    });

    on<SearchCastingCall>((event, emit) async {
      List<ccm.CastingCallModel> searchedCastingCallList =
          await searchCall(event.text);
      emit(CastingCallState(
          castingCallList: state.castingCallList,
          applicants: state.applicants,
          appliedCastingCallList: state.appliedCastingCallList,
          searchCastingCallList: searchedCastingCallList,
          selectedApplicants: state.selectedApplicants,
          rejectedApplicants: state.rejectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList));
    });

    on<AddToSortedList>((event, emit) async {
      Map<String, UserModel2> loadedApplicants = {};
      if (event.applicants != null) {
        for (int i = 0; i < event.applicants!.length; i++) {
          http.Response? response =
              await bc.BaseClient().profileApi(event.applicants![i].user!.sId!);

          if (response != null) {
            var data = jsonDecode(response.body);
            UserModel2 userModel2 = UserModel2.fromJson(data);
            loadedApplicants[event.applicants![i].user!.sId!] = userModel2;
          } else {
            print('not getting profile');
          }

          if (event.applicants![i].status == 'unreviewed') {
            state.unreviewedApplicants.add(event.applicants![i]);
          } else if (event.applicants![i].status == 'Select') {
            state.selectedApplicants.add(event.applicants![i]);
          } else if (event.applicants![i].status == 'Reject') {
            state.rejectedApplicants.add(event.applicants![i]);
          } else if (event.applicants![i].status == 'Bookmark') {
            state.bookmarkedApplicants.add(event.applicants![i]);
          } else if (event.applicants![i].status == 'Pending') {
            state.reviewedApplicants.add(event.applicants![i]);
          }
        }
      }
      emit(CastingCallState(
          applicants: loadedApplicants,
          castingCallList: state.castingCallList,
          appliedCastingCallList: state.appliedCastingCallList,
          searchCastingCallList: state.searchCastingCallList,
          selectedApplicants: state.selectedApplicants,
          rejectedApplicants: state.rejectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList));
    });

    on<RemoveFromSortedList>((event, emit) {
      emit(CastingCallState(
          applicants: state.applicants,
          castingCallList: state.castingCallList,
          createdCastingCallList: state.createdCastingCallList,
          appliedCastingCallList: state.appliedCastingCallList,
          searchCastingCallList: state.searchCastingCallList,
          selectedApplicants: [],
          rejectedApplicants: [],
          unreviewedApplicants: [],
          bookmarkedApplicants: [],
          reviewedApplicants: []));
    });

    on<LoadCreatedCastingCall>((event, emit) async {
      // ccm.CastingCallModel castingCallModel = ccm.CastingCallModel();
      List<CurrentUserModel> userdetails = await getAllUsers();
      String userID = userdetails[0].id!;
      // String userID = '64be578400ae57be46dfbf86';
      List<CreatedCastingCall> createdCastingCallList =
          await getCDCastingCalls(userID);
      emit(CastingCallState(
        applicants: state.applicants,
        castingCallList: state.castingCallList,
        createdCastingCallList: createdCastingCallList,
        appliedCastingCallList: state.appliedCastingCallList,
        rejectedApplicants: state.rejectedApplicants,
        selectedApplicants: state.selectedApplicants,
        unreviewedApplicants: state.unreviewedApplicants,
        bookmarkedApplicants: state.bookmarkedApplicants,
        reviewedApplicants: state.reviewedApplicants,
      ));
    });

    on<ProfileAddingInitialized>((event, emit) {
      emit(CastingCallState(
          applicants: state.applicants,
          castingCallList: state.castingCallList,
          appliedCastingCallList: state.appliedCastingCallList,
          searchCastingCallList: state.searchCastingCallList,
          selectedApplicants: state.selectedApplicants,
          rejectedApplicants: state.rejectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList,
          profileAddedStatus: 'Initialized'));
    });

    on<ProfileAdded>((event, emit) {
      emit(CastingCallState(
          applicants: state.applicants,
          castingCallList: state.castingCallList,
          appliedCastingCallList: state.appliedCastingCallList,
          searchCastingCallList: state.searchCastingCallList,
          selectedApplicants: state.selectedApplicants,
          rejectedApplicants: state.rejectedApplicants,
          unreviewedApplicants: state.unreviewedApplicants,
          bookmarkedApplicants: state.bookmarkedApplicants,
          reviewedApplicants: state.reviewedApplicants,
          createdCastingCallList: state.createdCastingCallList,
          profileAddedStatus: 'Completed'));
    });

    on<ChangeApplicantStatus>((event, emit) async {
      http.Response? response = await bc.BaseClient()
          .updateStatus(event.userID, event.postID, event.userStatus);

      if (response != null) {
        var data = jsonDecode(response.body);
        print('status update : $data');
      } else {
        print('status not updates');
      }
    });
  }

  Future<List<ccm.CastingCallModel>> getCastingCalls(
      ccm.CastingCallModel castingCallModel) async {
    List<ccm.CastingCallModel> castingCallList = [];
    const castingCallEndPoint = '/getPosts';
    String castingCallUrl = apiBase + castingCallEndPoint;
    final response = await http.post(Uri.parse(castingCallUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(castingCallModel.toJson()));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        castingCallList.add(ccm.CastingCallModel.fromJson(i));
      }
      return castingCallList;
    } else {
      return castingCallList;
    }
  }

  applyCastingCall(String userID, String postID) async {
    List<CurrentUserModel> userdetails = await getAllUsers();
    String userID = userdetails[0].id!;
    String urlEndPoint = '/applyJob?id=$postID&user=$userID';
    String url = apiBase + urlEndPoint;
    final response = await http.patch(Uri.parse(url));
    state.statusCode = response.statusCode;

    print(response.statusCode);
  }

  Future<List<ccm.CastingCallModel>> searchCall(String? text) async {
    List<ccm.CastingCallModel> castingCallList = [];
    if (text != null) {
      const logInendPoint = '/getPosts';
      final tokenURL = apiBase + logInendPoint;

      Map<String, String> toDatabaseJson() => {"search": text};

      final response = await http.post(
        Uri.parse(tokenURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(toDatabaseJson()),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> i in data) {
          castingCallList.add(ccm.CastingCallModel.fromJson(i));
        }
        print('search succesful');
        return castingCallList;
      } else {
        print(response.statusCode);
        return castingCallList;
        // print(data['message']);
      }
    } else {
      return castingCallList;
    }
  }
}

Future<List<CreatedCastingCall>> getCDCastingCalls(String userId) async {
  List<CreatedCastingCall> castingCallList = [];
  final castingCallEndPoint = '/getPosts?id=$userId';
  String castingCallUrl = apiBase + castingCallEndPoint;
  final response = await http.get(Uri.parse(castingCallUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      });

  if (response.statusCode == 200) {
    print('successful');
    var data = jsonDecode(response.body.toString());
    for (Map<String, dynamic> i in data) {
      castingCallList.add(CreatedCastingCall.fromJson(i));
    }
    return castingCallList;
  } else {
    print('failed');
    return castingCallList;
  }
}
