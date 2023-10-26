part of 'casting_call_bloc.dart';

class CastingCallEvent {}

class LoadCastingCall extends CastingCallEvent {}

class ApplyCastingCall extends CastingCallEvent {
  String postID;
  ApplyCastingCall({required this.postID});
}

class AppliedCastingCalls extends CastingCallEvent {}

class SearchCastingCall extends CastingCallEvent {
  String? text;
  SearchCastingCall({this.text});
}

class AddToSortedList extends CastingCallEvent {
  List<Applicants>? applicants;
  AddToSortedList({this.applicants});
}

class RemoveFromSortedList extends CastingCallEvent {}

class LoadCreatedCastingCall extends CastingCallEvent {}

class ProfileAddingInitialized extends CastingCallEvent {}

class ProfileAdded extends CastingCallEvent {}

class ChangeApplicantStatus extends CastingCallEvent {
  String userID;
  String postID;
  String userStatus;
  ChangeApplicantStatus(
      {required this.userID, required this.postID, required this.userStatus});
}
