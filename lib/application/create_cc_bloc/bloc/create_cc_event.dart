import 'package:file_picker/file_picker.dart';

class CreateCcEvent {}

class SubmitCastingCall extends CreateCcEvent {
  PlatformFile? pickFile;
  SubmitCastingCall({this.pickFile});
}

class ChangePosterButtonClicked extends CreateCcEvent {}

