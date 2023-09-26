import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';

import '../../../infrastructure/api_calls/api_calls.dart';
import 'create_cc_event.dart';
import 'create_cc_state.dart';

class CreateCcBloc extends Bloc<CreateCcEvent, CreateCcState> {
  CreateCcBloc() : super(CreateCcInitial(languages: [], roles: [])) {
    on<SubmitCastingCall>((event, emit) async {
      List<String> ageRange = [];
      ageRange.add(state.ageRange!.start.toInt().toString());
      ageRange.add(state.ageRange!.end.toInt().toString());
      StreamedResponse? response = await ApiCalls().createCastingCall(
        pickFile: state.pickFile,
        title: state.title,
        subTitle: state.subTitle,
        shortDescription: state.shortDescription,
        projectType: state.projectType,
        director: state.director,
        roles: state.roles,
        gender: state.gender,
        ageRange: ageRange,
        location: state.location,
        description: state.description,
        languages: state.languages,
      );
      print('CC BLOC status code = ${response!.statusCode}');
      if (response.statusCode == 200) {
        emit(CreateCcState(
            roles: state.roles,
            languages: state.languages,
            submissionStatus: 'Success'));
        print('success emitted');
      } else {
        emit(CreateCcState(
            pickFile: state.pickFile,
            title: state.title,
            subTitle: state.subTitle,
            shortDescription: state.shortDescription,
            author: state.author,
            projectType: state.projectType,
            director: state.director,
            gender: state.gender,
            description: state.description,
            location: state.location,
            roles: state.roles,
            ageRange: state.ageRange,
            languages: state.languages,
            submissionStatus: 'Failed'));
      }
    });

    on<ChangePosterButtonClicked>((event, emit) async {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result == null) return;
      state.pickFile = result.files.first;
      emit(CreateCcState(
          pickFile: result.files.first,
          title: state.title,
          subTitle: state.subTitle,
          shortDescription: state.shortDescription,
          author: state.author,
          projectType: state.projectType,
          director: state.director,
          gender: state.gender,
          description: state.description,
          location: state.location,
          roles: state.roles,
          ageRange: state.ageRange,
          languages: state.languages,
          submissionStatus: 'Initial'));
    });
  }
}
