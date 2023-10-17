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

  CastingCallState(
      {this.castingCallList,
      this.createdCastingCallList,
      this.statusCode,
      required this.appliedCastingCallList,
      this.searchCastingCallList, required this.rejectedApplicants, required this.selectedApplicants, required this.unreviewedApplicants});
}

class CastingCallInitial extends CastingCallState {
  CastingCallInitial({required super.appliedCastingCallList, required super.rejectedApplicants, required super.selectedApplicants, required super.unreviewedApplicants});
}
