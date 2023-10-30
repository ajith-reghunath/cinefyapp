import 'dart:convert';
import 'dart:io';

import 'package:cinefy/application/login_bloc/login_bloc.dart';
import 'package:cinefy/application/login_bloc/login_state.dart';
import 'package:cinefy/application/Option_Bloc/option_bloc.dart';
import 'package:cinefy/application/artist_profile_bloc/artist_profile_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/domain/profile/profile_model.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:cinefy/presentation/profile/screen_profile_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../application/bloc_user/user_bloc.dart';
import '../../application/drop_down_bloc/drop_down_bloc.dart';
import '../../core/constants.dart';

// ignore: must_be_immutable
class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  PlatformFile? pickFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  int k = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return BlocBuilder<DropDownBloc, DropDownState>(
          builder: (context1, state1) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return BlocBuilder<OptionBloc, OptionState>(
                  builder: (context, optionState) {
                    return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
                      builder: (context, artistState) {
                        if (k == 0) {
                          nameController.text = userState.name ?? '';
                          ageController.text =
                              (userState.age.toString() == 'null')
                                  ? ''
                                  : userState.age.toString();
                          bioController.text = userState.bio ?? '';
                          k = 1;
                        }
                        return SafeArea(
                          child: SingleChildScrollView(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: StickyHeader(
                                  header: Container(
                                    width: width,
                                    color: primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          screenTitle('Artist Profile'),
                                          saveButton(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      profilePicture(width),
                                      interests(userState.roles!),
                                      Wrap(
                                          children: userState.roles!
                                              .map((e) => displayTag(e))
                                              .toList()),
                                      langugagePreference(userState.languages!),
                                      Wrap(
                                          children: userState.languages!
                                              .map((e) => displayTag(e))
                                              .toList()),
                                      nameField(nameController),
                                      ageField(ageController),
                                      genderField(),
                                      bioField(bioController)
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result == null) return;
    pickFile = result.files.first;
  }

  updateProfile(File photoFile) async {
    const updateProfileEndPoint = '/updateProfile';
    final tokenURL = apiBase + updateProfileEndPoint;
    ProfileModel profileModel = ProfileModel(
        name: 'ajith',
        age: '23',
        userID: 'ddsd',
        roles: ['actor'],
        gender: 'Male',
        photo: photoFile,
        cover: '',
        bio: '',
        intro: '',
        skills: [],
        certifications: [],
        languages: [],
        workExperience: [],
        education: []);

    final response = await http.post(
      Uri.parse(tokenURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(profileModel.toDatabaseJson()),
    );

    if (response.statusCode == 200) {
      print('successful');
    } else {
      print(response.statusCode);
      // print(data['message']);
    }
  }

  // Future<void> updateProfile2(
  //     File photoFile2, String token, String userID) async {
  //   const updateProfileEndPoint = '/updateProfile';
  //   final tokenURL = apiBase + updateProfileEndPoint;
  //   ProfileModel profileModel = ProfileModel(
  //       name: 'ajith',
  //       age: '23',
  //       userID: userID,
  //       roles: ['actor'],
  //       gender: 'Male',
  //       photo: photoFile2,
  //       cover: '',
  //       bio: '',
  //       intro: '',
  //       skills: [],
  //       certifications: [],
  //       languages: [],
  //       workExperience: [],
  //       education: []);

  //   // Create a multipart request
  //   final request = http.MultipartRequest('POST', Uri.parse(tokenURL));

  //   // Add profileModel as a field in the request
  //   request.fields['name'] = profileModel.name;
  //   if (profileModel.age != null) {
  //     request.fields['age'] = profileModel.age!;
  //   }

  //   request.fields['gender'] = profileModel.gender;
  //   request.fields['roles'] = profileModel.roles.toString();
  //   request.fields['cover'] = profileModel.cover;
  //   request.fields['bio'] = profileModel.bio;
  //   request.fields['intro'] = profileModel.intro;
  //   request.fields['skills'] = profileModel.skills.toString();
  //   request.fields['certifications'] = profileModel.certifications.toString();
  //   request.fields['languages'] = profileModel.languages.toString();
  //   request.fields['workExp'] = profileModel.workExperience.toString();
  //   request.fields['education'] = profileModel.education.toString();
  //   request.fields['_id'] = profileModel.userID.toString();
  //   // Add other fields as needed...

  //   // Add the photoFile as a file in the request
  //   final photoFile = await http.MultipartFile.fromPath(
  //     'image', // Field name for the file
  //     profileModel.photo!.path, // Path to the file
  //     contentType:
  //         MediaType('image', 'jpeg'), // Adjust the content type as needed
  //   );
  //   request.files.add(photoFile);
  //   request.headers['token'] = token;

  //   // Send the request
  //   final response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('successful');
  //   } else {
  //     print(response.statusCode);
  //   }
  // }
}
