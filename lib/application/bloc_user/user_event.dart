import 'package:http/http.dart';

import '../../domain/casting_call/casting_call_model.dart' as package1;
import '../../domain/casting_call/casting_call_model.dart';

class UserEvent {}

class LoadUser extends UserEvent {
  Response? response;
  LoadUser({this.response});
}

class LoadUserMethod2 extends UserEvent {}

class SaveUser extends UserEvent {}

class UserApplied extends UserEvent {}

class IsApplied extends UserEvent {
  List<package1.Applicants>? applicantsList;
  String? id;
  IsApplied({this.applicantsList, this.id});
}

class RecommendedCastingCalls extends UserEvent {
  List<CastingCallModel>? castingCallList;

  RecommendedCastingCalls({this.castingCallList});
}

class Bookmark extends UserEvent {}

class UpdateAppliedList extends UserEvent {
  CastingCallModel ? castingCall;
  UpdateAppliedList({this.castingCall});
}
