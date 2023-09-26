import 'dart:io';

import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_bloc.dart';
import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_event.dart';
import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_state.dart';
import 'package:cinefy/application/drop_down_bloc/drop_down_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/presentation/status_screen/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/Option_Bloc/option_bloc.dart';
import '../../application/artist_profile_bloc/artist_profile_bloc.dart';
import '../../core/fontSize.dart';
import '../common widgets/common_widgets.dart';

Widget castingCallPicture(double width) {
  return BlocBuilder<ArtistProfileBloc, ArtistProfileState>(
    builder: (context, artistState) {
      return BlocBuilder<CreateCcBloc, CreateCcState>(
        builder: (context, createCastingCallState) {
          return SizedBox(
            width: width,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Thumbnail',
                      style: TextStyle(fontSize: fontSize2, color: shade3)),
                  castingCallPictureWidget(width),
                  // artistState.pickFile == null
                  //     ? imageContainer(
                  //         width, const AssetImage('assets/images/profileicon.png'))
                  //     : imageContainer(
                  //         width, FileImage(File(artistState.pickFile!.path!))),

                  SizedBox(
                    width: width,
                    child: Center(
                      child: TextButton(
                        onPressed: () async {
                          context
                              .read<CreateCcBloc>()
                              .add(ChangePosterButtonClicked());
                        },
                        child: const Text(
                          'Select file',
                          style: TextStyle(
                              fontSize: fontSize3, color: accentColor),
                        ),
                      ),
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

Widget castingCallPictureWidget(double width) {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, castingCallState) {
      if (castingCallState.pickFile == null) {
        return castingCallmageContainer(
            width, const AssetImage('assets/images/profileicon.png'));
      } else {
        return castingCallmageContainer(
          width,
          FileImage(File(castingCallState.pickFile!.path!)),
        );
      }
    },
  );
}

Widget castingCallmageContainer(
    double width, ImageProvider<Object>? backgroundImage) {
  return Container(
    width: width,
    height: 0.5 * width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: backgroundImage!,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget projectType() {
  List itemList = [
    'Advertisement',
    'Documentary',
    'Modelling',
    'Movie',
    'Music Video',
    'Short Film',
    'Web Series'
  ];
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return BlocBuilder<DropDownBloc, DropDownState>(
        builder: (context, dropDownState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text('Project Type',
                    style: TextStyle(fontSize: fontSize2, color: shade3)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: shade5, borderRadius: BorderRadius.circular(7)),
                child: DropdownButton(
                    hint: const Text(
                      'Select',
                      style: TextStyle(fontSize: 16, color: shade3),
                    ),
                    value: dropDownState.selectedProjectType,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    iconEnabledColor: shade1,
                    iconDisabledColor: shade4,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(
                        color: shade2,
                        fontSize: fontSize4,
                        fontFamily: 'PoppinsRegular'),
                    items: itemList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      context.read<DropDownBloc>().add(
                          DropDownSelected(selectedValue: newValue.toString()));
                      state.projectType = newValue.toString();
                    }),
              )
            ],
          );
        },
      );
    },
  );
}

Widget projectLanguage() {
  List itemList = [
    'Malayalam',
    'Tamil',
    'Telugu',
    'Hindi',
    'Kannada',
    'English'
  ];
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return BlocBuilder<DropDownBloc, DropDownState>(
        builder: (context, dropDownState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text('Project Language',
                    style: TextStyle(fontSize: fontSize2, color: shade3)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: shade5, borderRadius: BorderRadius.circular(7)),
                child: DropdownButton(
                    hint: const Text(
                      'Select',
                      style: TextStyle(fontSize: 16, color: shade3),
                    ),
                    value: dropDownState.selectedLanguageType,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    iconEnabledColor: shade1,
                    iconDisabledColor: shade4,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(
                        color: shade2,
                        fontSize: fontSize4,
                        fontFamily: 'PoppinsRegular'),
                    items: itemList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      context.read<DropDownBloc>().add(LanguageDropDownSelected(
                          selectedValue: newValue.toString()));
                      state.languages.add(newValue.toString());
                    }),
              )
            ],
          );
        },
      );
    },
  );
}

Widget selectGender() {
  return BlocBuilder<OptionBloc, OptionState>(
    builder: (context, optionState) {
      return BlocBuilder<CreateCcBloc, CreateCcState>(
        builder: (context, ccState) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Gender',
                    style: TextStyle(fontSize: fontSize2, color: shade3)),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(FemaleButtonClicked());
                        ccState.gender = 'female';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color: optionState.gender == 'female'
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
                            color: optionState.gender == 'female'
                                ? accentColor
                                : shade4),
                      ),
                    ),
                    sizedBoxW10(),
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(MaleButtonClicked());
                        ccState.gender = 'male';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color: optionState.gender == 'male'
                                ? accentColor
                                : shade4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'male',
                        style: TextStyle(
                            fontSize: fontSize2,
                            color: optionState.gender == 'male'
                                ? accentColor
                                : shade4),
                      ),
                    ),
                    sizedBoxW10(),
                    OutlinedButton(
                      onPressed: () {
                        context.read<OptionBloc>().add(OthersButtonClicked());
                        ccState.gender = 'others';
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2,
                            color: optionState.gender == 'others'
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
                            color: optionState.gender == 'others'
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

Widget selectRole() {
  List itemList = [
    'Actor',
    'Actress',
    'Child Actor',
    'Child Actress',
    'Assistant Director',
    'Editor',
    'Cinematographer'
  ];
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return BlocBuilder<DropDownBloc, DropDownState>(
        builder: (context, dropDownState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text('Role',
                    style: TextStyle(fontSize: fontSize2, color: shade3)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: shade5, borderRadius: BorderRadius.circular(7)),
                child: DropdownButton(
                    hint: const Text(
                      'Select',
                      style: TextStyle(fontSize: 16, color: shade3),
                    ),
                    value: dropDownState.selectedRoleType,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    iconEnabledColor: shade1,
                    iconDisabledColor: shade4,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(
                        color: shade2,
                        fontSize: fontSize4,
                        fontFamily: 'PoppinsRegular'),
                    items: itemList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      context.read<DropDownBloc>().add(
                          RoleSelected(selectedValue: newValue.toString()));
                      state.roles.add(newValue.toString());
                    }),
              )
            ],
          );
        },
      );
    },
  );
}

class AgeSliderWidget extends StatefulWidget {
  const AgeSliderWidget({super.key});

  @override
  State<AgeSliderWidget> createState() => _AgeSliderWidgetState();
}

class _AgeSliderWidgetState extends State<AgeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<CreateCcBloc, CreateCcState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text('Age Range',
                  style: TextStyle(fontSize: fontSize2, color: shade3)),
            ),
            SliderTheme(
              data: SliderThemeData(
                  trackHeight: 1.5,
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                  showValueIndicator: ShowValueIndicator.always,
                  inactiveTickMarkColor: Colors.transparent,
                  valueIndicatorTextStyle:
                      const TextStyle(fontFamily: 'PoppinsRegular')),
              child: RangeSlider(
                values: _currentRangeValues,
                max: 100,
                activeColor: accentColor,
                inactiveColor: shade5,
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                  state.ageRange = values;
                },
              ),
            ),
            SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: shade4),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        state.ageRange == null
                            ? '20'
                            : state.ageRange!.start.toInt().toString(),
                        style: const TextStyle(fontSize: fontSize2),
                      ),
                    ),
                  ),
                  Text('  -  '),
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: shade4),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        state.ageRange == null
                            ? '80'
                            : state.ageRange!.end.toInt().toString(),
                        style: const TextStyle(fontSize: fontSize2),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

Widget enterTitle() {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Project Title',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor: shade1,
                      hintText: 'Enter title',
                      hintStyle: TextStyle(color: shade3)),
                  onChanged: (value) {
                    state.title = value;
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

Widget castingCallTitle() {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Casting Call Title',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor: shade1,
                      hintText: 'Enter title',
                      hintStyle: TextStyle(color: shade3)),
                  onChanged: (value) {
                    state.subTitle = value;
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

Widget shortDescription() {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Casting Call Description',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor: shade1,
                      hintText: 'Enter text',
                      hintStyle: TextStyle(color: shade3)),
                  onChanged: (value) {
                    state.shortDescription = value;
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

Widget projectDirector() {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Project Director',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor: shade1,
                      hintText: 'Enter the name of director',
                      hintStyle: TextStyle(color: shade3)),
                  onChanged: (value) {
                    state.director = value;
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

Widget projectLocation() {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Project Location',
                style: TextStyle(fontSize: fontSize2, color: shade3)),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                  color: shade5, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormField(
                  style: const TextStyle(fontSize: fontSize2),
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusColor: shade1,
                      hintText: 'Enter the location for this project',
                      hintStyle: TextStyle(color: shade3)),
                  onChanged: (value) {
                    state.location = value;
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

Widget submitButton(double width, double height) {
  return BlocBuilder<CreateCcBloc, CreateCcState>(
      builder: (context, createCcState) {
    return TextButton(
      onPressed: () {
        if (createCcState.projectType == null) {
          showSnackBar(context, 'Please select the project type');
        } else if (createCcState.languages.isEmpty) {
          showSnackBar(context, 'Please select a project language');
        } else if (createCcState.title == null) {
          showSnackBar(context, 'Please enter the project title');
        } else if (createCcState.subTitle == null) {
          showSnackBar(context, 'Please enter the casting call title');
        } else if (createCcState.roles.isEmpty) {
          showSnackBar(context, 'Please select a role');
        } else if (createCcState.ageRange == null) {
          showSnackBar(context, 'Please enter age range');
        } else if (createCcState.gender == null) {
          showSnackBar(context, 'Please select a gender');
        } else if (createCcState.shortDescription == null) {
          showSnackBar(context, 'Please enter casting call description');
        } else if (createCcState.director == null) {
          showSnackBar(context, 'Please enter the name of the director');
        } else if (createCcState.location == null) {
          showSnackBar(context, 'Please the location of the project');
        } else if (createCcState.pickFile == null) {
          showSnackBar(context, 'Please upload a thumbnail');
        } else {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0), // Adjust the top radius as needed
              )),
              builder: (BuildContext context) {
                return SizedBox(
                    // height: 0.3 * height,
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    sizedBox1(),
                    const Text(
                      'Would you like to\nsubmit this casting call ?',
                      style: TextStyle(fontSize: 18),
                    ),
                    sizedBox1(),
                    Container(
                      color: shade5,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  context
                                      .read<CreateCcBloc>()
                                      .add(SubmitCastingCall());
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return const StatusScreen();
                                    }),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: accentColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 20),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: fontSize2,
                                          color: primaryColor),
                                    ),
                                  ),
                                )),
                            const SizedBox(width: 40),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primaryColor,
                                      border:
                                          Border.all(width: 1, color: shade3)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 20),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: fontSize2, color: shade2),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
              });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(7)),
        height: 50,
        width: 0.5 * width,
        child: const Center(
          child: Text(
            'Submit',
            style: TextStyle(fontSize: fontSize2, color: primaryColor),
          ),
        ),
      ),
    );
  });
}
