part of 'casting_call_bloc.dart';

class CastingCallState {
  List<ccm.CastingCallModel>? castingCallList;
  List<CreatedCastingCall>? createdCastingCallList;
  int? statusCode;
  List<ccm.CastingCallModel> appliedCastingCallList = [];
  List<ccm.CastingCallModel>? searchCastingCallList;

  List<Applicants> selectedApplicants = [];
  List<Applicants> rejectedApplicants = [];
  List<Applicants> unreviewedApplicants = [];
  List<Applicants> bookmarkedApplicants = [];
  List<Applicants> reviewedApplicants = [];

  Map<String, UserModel2> applicants = {};

  String ? profileAddedStatus;

  CastingCallState(
      {this.castingCallList,
      this.createdCastingCallList,
      this.statusCode,
      required this.appliedCastingCallList,
      this.searchCastingCallList,
      this.profileAddedStatus = 'Completed',
      required this.rejectedApplicants,
      required this.selectedApplicants,
      required this.unreviewedApplicants,
      required this.applicants,
      required this.bookmarkedApplicants,
      required this.reviewedApplicants});
}

class CastingCallInitial extends CastingCallState {
  CastingCallInitial(
      {required super.appliedCastingCallList,
      required super.rejectedApplicants,
      required super.selectedApplicants,
      required super.unreviewedApplicants,
      required super.applicants,
      required super.bookmarkedApplicants,
      required super.reviewedApplicants,
      });
}
