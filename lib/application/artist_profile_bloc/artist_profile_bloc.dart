import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../core/constants.dart';
import '../../domain/profile/profile_model.dart';
import '../../infrastructure/Functions/current_user_functions.dart';
import '../../infrastructure/Models/current_user.dart';
import 'package:http/http.dart' as http;

part 'artist_profile_event.dart';
part 'artist_profile_state.dart';

class ArtistProfileBloc extends Bloc<ArtistProfileEvent, ArtistProfileState> {
  ArtistProfileBloc() : super(ArtistProfileInitial()) {
    on<ChangePhotoButtonClicked>((event, emit) async {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result == null) return;
      emit(ArtistProfileState(pickFile: result.files.first));
    });

    on<SaveButtonClicked>((event, emit) async {
      print('one');
      CurrentUserModel? currentUser = await displayUserData();
      final token = currentUser!.tokenId;
      final userID = currentUser.id;
      print('two');
      print('userID : $userID');
      print('gender : ${event.gender}');
      print('bio : ${event.bio}');
      // if (state.pickFile != null)
      const updateProfileEndPoint = '/updateProfile';
      final tokenURL = apiBase + updateProfileEndPoint;
      ProfileModel profileModel = ProfileModel(
          name: event.name,
          age: event.age,
          userID: userID!,
          roles: event.interests,
          gender: event.gender!,
          cover: '',
          bio: event.bio!,
          intro: '',
          skills: [],
          certifications: [],
          languages: event.languages,
          workExperience: [],
          education: []);
      print('three ');
      // String requestBody = jsonEncode(profileModel.toDatabaseJson());

      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(tokenURL));

      // // Add profileModel as a field in the request

      if (profileModel.age != null) {
        request.fields['age'] = profileModel.age!;
        print(profileModel.age!.toString());
      }

      if (profileModel.name != null) {
        request.fields['name'] = profileModel.name!;
      }

      request.fields['gender'] = profileModel.gender;

      request.fields['cover'] = profileModel.cover;
      request.fields['bio'] = profileModel.bio;
      request.fields['intro'] = profileModel.intro;
      request.fields['skills'] = profileModel.skills.toString();
      request.fields['certifications'] = profileModel.certifications.toString();

      request.fields['workExp'] = profileModel.workExperience.toString();
      request.fields['education'] = profileModel.education.toString();
      request.fields['_id'] = profileModel.userID.toString();

      if (profileModel.roles != null) {
        for (String string in profileModel.roles!) {
          request.files.add(http.MultipartFile.fromString('roles', string));
        }
      }

      if (profileModel.languages != null) {
        for (String string in profileModel.languages!) {
          request.files.add(http.MultipartFile.fromString('languages', string));
        }
      }

      // Add other fields as needed...

      // Add the photoFile as a file in the request
      if (state.pickFile != null) {
        final file = File(state.pickFile!.path!);
        final photoFile = await http.MultipartFile.fromPath(
          'image', // Field name for the file
          file.path, // Path to the file
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(photoFile);
      }

      if (state.pickFile == null) {
        request.fields['photo'] = event.photo!;
        // print(event.photo!);
      }

      request.headers['token'] = token!;

      // Send the request
      final response = await request.send();

      if (response.statusCode == 200) {
        print('successful');
      } else {
        print(response.statusCode);
      }

      // else {
      //   ProfileModel profileModel = ProfileModel(
      //       name: 'ajith',
      //       age: '23',
      //       userID: userID!,
      //       roles: ['Dancing', 'Singing'],
      //       gender: 'Male',
      //       photo: null,
      //       cover: '',
      //       bio: '',
      //       intro: '',
      //       skills: [],
      //       certifications: [],
      //       languages: [],
      //       workExperience: [],
      //       education: []);

      //   const updateProfileEndPoint = '/updateProfile';
      //   final postURL = apiBase + updateProfileEndPoint;
      //   final response = await http.post(
      //     Uri.parse(postURL),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'token': token!
      //     },
      //     body: jsonEncode(profileModel.toDatabaseJson()),
      //   );
      //   print('XXXXXXXXXXXX${response.statusCode}');
      // }
    });
  }
}
