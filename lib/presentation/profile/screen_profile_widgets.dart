import 'dart:io';

import 'package:cinefy/application/Option_Bloc/option_bloc.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/artist_profile_bloc/artist_profile_bloc.dart';
import '../../application/bloc_user/user_bloc.dart';
import '../../core/colors.dart';
import '../../core/fontSize.dart';
import '../common widgets/Drop down widget/drop_down_widget.dart';

Widget displayTag(String? tagtext) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(width: 1, color: shade4),
              color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Text(
              tagtext ?? 'Not given',
              style: const TextStyle(fontSize: fontSize2, color: shade1),
            ),
          ),
        ),
        const SizedBox(width: 5)
      ],
    ),
  );
}

Widget nameField(TextEditingController nameController) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('name',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: nameController,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(fontSize: fontSize4),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusColor: shade1,
                    hintText: 'Enter text',
                  ),
                  onChanged: (value) {
                    state.name = value;
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget ageField(TextEditingController ageController) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('age',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: ageController,
                  style: const TextStyle(fontSize: fontSize4),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusColor: shade1,
                    hintText: 'Enter text',
                  ),
                  onChanged: (value) {
                    state.age = int.parse(value);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget genderField() {
  return BlocBuilder<OptionBloc, OptionState>(
    builder: (context, state) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          if (userState.gender == 'male') {
            context.read<OptionBloc>().add(MaleButtonClicked());
          } else if (userState.gender == 'female') {
            context.read<OptionBloc>().add(FemaleButtonClicked());
          } else if (userState.gender == 'others') {
            context.read<OptionBloc>().add(OthersButtonClicked());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('gender',
                    style: TextStyle(fontSize: fontSize2, color: shade3)),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(FemaleButtonClicked());
                        userState.gender = 'female';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color: state.gender == 'female'
                                ? accentColor
                                : shade4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'female',
                        style: TextStyle(
                            fontSize: fontSize2,
                            color: state.gender == 'female'
                                ? accentColor
                                : shade4),
                      ),
                    ),
                    sizedBoxW10(),
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(MaleButtonClicked());
                        userState.gender = 'male';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color:
                                state.gender == 'male' ? accentColor : shade4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'male',
                        style: TextStyle(
                            fontSize: fontSize2,
                            color:
                                state.gender == 'male' ? accentColor : shade4),
                      ),
                    ),
                    sizedBoxW10(),
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(OthersButtonClicked());
                        userState.gender = 'others';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color: state.gender == 'others'
                                ? accentColor
                                : shade4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'others',
                        style: TextStyle(
                            fontSize: fontSize2,
                            color: state.gender == 'others'
                                ? accentColor
                                : shade4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget interests(List<dynamic> selectedItemsList) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'interests',
        style: TextStyle(fontSize: fontSize2, color: shade3),
      ),
      MultiSelectDropDownCheckBox(
        items: const [
          'Acting',
          'Animation',
          'Cinematography',
          'Content Creation',
          'Dancing',
          'Directing',
          'Dubbing',
          'Editing',
          'Graphic Designing',
          'Photography',
          'Poster Designing',
          'Singing',
          'Sound Designing',
          'Writing'
        ],
        buttonText: 'edit',
        dropBoxTitle: 'Select your interests',
        selectedItemsList: selectedItemsList,
      ),
    ],
  );
}

Widget langugagePreference(List<dynamic> selectedItemsList) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'language preference',
        style: TextStyle(fontSize: fontSize2, color: shade3),
      ),
      MultiSelectDropDownCheckBox(
          items: const [
            'Malayalam',
            'Tamil',
            'Kannada',
            'Hindi',
            'Telugu',
            'Bhojpuri'
          ],
          buttonText: 'edit',
          dropBoxTitle: 'Select your language',
          selectedItemsList: selectedItemsList),
    ],
  );
}

Widget profilePicture(double width) {
  return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
    builder: (context, artistState) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userstate) {
          return SizedBox(
            width: width,
            child: Center(
              child: Column(
                children: [
                  profilePictureWidget(width),
                  // artistState.pickFile == null
                  //     ? imageContainer(
                  //         width, const AssetImage('assets/images/profileicon.png'))
                  //     : imageContainer(
                  //         width, FileImage(File(artistState.pickFile!.path!))),

                  TextButton(
                    onPressed: () async {
                      context
                          .read<ArtistProfileBloc>()
                          .add(ChangePhotoButtonClicked());
                    },
                    child: const Text(
                      'Select file',
                      style: TextStyle(fontSize: fontSize3, color: accentColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget profilePictureWidget(double width) {
  return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
    builder: (context, artistState) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          if (artistState.pickFile == null) {
            if (userState.photo == null) {
              return imageContainer(
                  width, const AssetImage('assets/images/profileicon.png'));
            } else {
              return imageContainer(
                  width,
                  NetworkImage(
                      'https://app.nex-gen.shop/dp/${userState.photo}'));
            }
          } else {
            return imageContainer(
              width,
              FileImage(File(artistState.pickFile!.path!)),
            );
          }
        },
      );
    },
  );
}

Widget imageContainer(double width, ImageProvider<Object>? backgroundImage) {
  return Container(
    width: width,
    height: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: backgroundImage!,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget bioField(TextEditingController bioController) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('bio',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: bioController,
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusColor: shade1,
                    hintText: 'Enter text',
                  ),
                  onChanged: (value) {
                    state.bio = value;
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget saveButton() {
  return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
    builder: (context, artistState) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return TextButton(
              onPressed: () async {
                print((userState.age.toString() == 'null'));
                if (userState.photo == null && artistState.pickFile == null) {
                  showSnackBar(context, 'Please upload a profile picture');
                } else if (userState.name.toString() == 'null') {
                  showSnackBar(context, 'Please enter the name');
                } else if (userState.age.toString() == 'null') {
                  showSnackBar(context, 'Please enter the age');
                } else if (userState.gender == null) {
                  showSnackBar(context, 'Please select the gender');
                } else if (userState.bio == null) {
                  showSnackBar(context, 'Please enter the bio');
                } else {
                  context.read<ArtistProfileBloc>().add(SaveButtonClicked(
                      languages: userState.languages,
                      interests: userState.roles,
                      photo: userState.photo,
                      name: userState.name,
                      age: userState.age.toString(),
                      gender: userState.gender,
                      bio: userState.bio));
                  showSnackBar(context, 'Profile Updated Successfully');
                }

                // if (artistState.pickFile == null) {
                //   showSnackBar(context, 'Please upload a profile picture');
                // } else {
                //   context.read<ArtistProfileBloc>().add(SaveButtonClicked(interests: dropDownState.interests));
                //   showSnackBar(context, 'Profile Updated Successfully');
                // }
              },
              child: const Text(
                'save',
                style: TextStyle(fontSize: fontSize4, color: accentColor),
              ));
        },
      );
    },
  );
}
