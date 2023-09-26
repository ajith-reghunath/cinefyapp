import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/ui_bloc/ui_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/bloc_user/user_bloc.dart';

Widget options(double width) {
  return BlocBuilder<UiBloc, UiState>(
    builder: (context, state) {
      return Row(
        children: [
          SizedBox(
            width: 0.49 * width,
            child: Column(
              children: [
                Text(
                  'Requirements',
                  style: TextStyle(
                      fontSize: fontSize2,
                      color: state.colorIndex == 0 ? accentColor : shade3),
                ),
                sizedBoxH10(),
                Container(
                  height: 2,
                  color: state.colorIndex == 0 ? accentColor : primaryColor,
                )
              ],
            ),
          ),
          SizedBox(
            width: 0.02 * width,
          ),
          SizedBox(
            width: 0.49 * width,
            child: Column(
              children: [
                Text('Project Details',
                    style: TextStyle(
                        fontSize: fontSize2,
                        color: state.colorIndex == 1 ? accentColor : shade3)),
                sizedBoxH10(),
                Container(
                  height: 2,
                  color: state.colorIndex == 1 ? accentColor : primaryColor,
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget options1(double width) {
  return BlocBuilder<UiBloc, UiState>(
    builder: (context, state) {
      return Row(
        children: [
          SizedBox(
            width: 0.49 * width,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      context.read<UiBloc>().add(IndexChanged(index: 1));
                    },
                    child: Text(
                      'Requirements',
                      style: TextStyle(
                          fontSize: fontSize2,
                          color: state.colorIndex == 1 ? accentColor : shade3),
                    )),
                Container(
                  height: 2,
                  color: state.colorIndex == 1 ? accentColor : primaryColor,
                )
              ],
            ),
          ),
          SizedBox(
            width: 0.02 * width,
          ),
          SizedBox(
            width: 0.49 * width,
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      context.read<UiBloc>().add(IndexChanged(index: 2));
                    },
                    child: Text(
                      'Project Details',
                      style: TextStyle(
                          fontSize: fontSize2,
                          color: state.colorIndex == 2 ? accentColor : shade3),
                    )),
                Container(
                  height: 2,
                  color: state.colorIndex == 2 ? accentColor : primaryColor,
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget widget1(double width) {
  return BlocBuilder<UiBloc, UiState>(
    builder: (context, state) {
      return state.colorIndex == 1
          ? requirementWidget(width)
          : Container(
              width: width,
              height: 20,
              color: Colors.red,
            );
    },
  );
}

Widget details(double width, int castingIndex) {
  return BlocBuilder<UiBloc, UiState>(
    builder: (context, uiState) {
      return BlocBuilder<CastingCallBloc, CastingCallState>(
        builder: (context, castingState) {
          return CustomScrollView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            slivers: <Widget>[
              // SliverToBoxAdapter for non-scrollable content (if needed)
              uiState.colorIndex == 1
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: shade4)),
                              width: width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 15, bottom: 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundColor: Colors.transparent,
                                          child: ClipOval(
                                            child: castingState
                                                        .castingCallList![
                                                            castingIndex]
                                                        .gender ==
                                                    'male'
                                                ? Image.asset(
                                                    'assets/images/male.png',
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    'assets/images/female.png',
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        sizedBoxW20(),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Male Actor',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '20 - 23 years',
                                              style: TextStyle(
                                                  fontSize: 14, color: shade2),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    sizedBoxH20(),
                                    divider(),
                                    sizedBoxH15(),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: 1, color: shade4),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Text(
                                            'Other details',
                                            style: TextStyle(
                                                fontSize: fontSize5,
                                                color: shade3),
                                          ),
                                        )),
                                    sizedBoxH10(),
                                    const Text(
                                      'Should have a muscular body. \nShould be from Trivandrum.',
                                      style: TextStyle(fontSize: fontSize3),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 10, // Replace with your item count
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(width: 1, color: shade4)),
                                  width: width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    child: Text(
                                        'Project type   :   ${castingState.castingCallList![castingIndex].projectType!}',
                                        style: const TextStyle(
                                            fontSize: fontSize2)),
                                  ),
                                ),
                                sizedBoxH15(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(width: 1, color: shade4)),
                                  width: width,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      child: castingState
                                              .castingCallList![castingIndex]
                                              .language!
                                              .isEmpty
                                          ? const Text(
                                              'Language   :   not given',
                                              style: TextStyle(
                                                  fontSize: fontSize2))
                                          : Text(
                                              'Language   :   ${castingState.castingCallList![castingIndex].language![0]}',
                                              style: const TextStyle(
                                                  fontSize: fontSize2))),
                                ),
                                sizedBoxH15(),
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border:
                                          Border.all(width: 1, color: shade4)),
                                  width: width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                        top: 15,
                                        bottom: 13),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  width: 1, color: shade4),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 4),
                                              child: Text(
                                                'More details',
                                                style: TextStyle(
                                                    fontSize: fontSize5,
                                                    color: shade3),
                                              ),
                                            )),
                                        sizedBoxH10(),
                                        Text(
                                          castingState
                                              .castingCallList![castingIndex]
                                              .description!,
                                          style: const TextStyle(
                                              fontSize: fontSize2),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                sizedBoxH20(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Published by',
                                          style: TextStyle(
                                              fontSize: fontSize3,
                                              color: shade3),
                                        ),
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.transparent,
                                          child: ClipOval(
                                              child: Image.asset(
                                            'assets/images/male.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Text(
                                          castingState
                                              .castingCallList![castingIndex]
                                              .author!
                                              .name!,
                                          style: const TextStyle(
                                              color: shade1,
                                              fontSize: fontSize2),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Directed by',
                                          style: TextStyle(
                                              fontSize: fontSize3,
                                              color: shade3),
                                        ),
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.transparent,
                                          child: ClipOval(
                                              child: Image.asset(
                                            'assets/images/male.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Text(
                                          castingState
                                              .castingCallList![castingIndex]
                                              .director!,
                                          style: const TextStyle(
                                              color: shade1,
                                              fontSize: fontSize2),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        childCount: 1, // Replace with your item count
                      ),
                    )
              // SliverList for the inner vertical scrollable content
            ],
          );
        },
      );
    },
  );
}

Widget requirementWidget(double width) {
  return Column(
    children: [
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                height: 200,
                color: Colors.yellow,
                child: Text(index.toString()),
              ),
            );
          })
    ],
  );
  // Container(
  //   width: width,
  //   height: 20,
  //   color: Colors.yellow,
  //   child: Text('rr'),
  // );
}

Widget backButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    ],
  );
}

Widget applyButton(double width, double height, int index) {
  return BlocBuilder<CastingCallBloc, CastingCallState>(
    builder: (context, castingState) {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return TextButton(
            onPressed: () {
              userState.isApplied == false
                  ? showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            20.0), // Adjust the top radius as needed
                      )),
                      builder: (BuildContext context) {
                        return SizedBox(
                            // height: 0.3 * height,
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            sizedBox1(),
                            const Text(
                              'Would you like to submit your\n   profile for this casting call ?',
                              style: TextStyle(fontSize: 18),
                            ),
                            sizedBox1(),
                            Container(
                              color: shade5,
                              width: width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          context.read<CastingCallBloc>().add(
                                              ApplyCastingCall(
                                                  postID: castingState
                                                      .castingCallList![index]
                                                      .sId!));
                                          context
                                              .read<CastingCallBloc>()
                                              .add(LoadCastingCall());
                                          Navigator.pop(context);
                                          showSnackBar(context,
                                              'Your profile is submitted');
                                          castingState.appliedCastingCallList.add(castingState
                                                      .castingCallList![index]);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
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
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: primaryColor,
                                              border: Border.all(
                                                  width: 1, color: shade3)),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 20),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontSize: fontSize2,
                                                  color: shade2),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ));
                      })
                  : showSnackBar(context, 'You already submitted the profile');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(7)),
              width: width,
              height: 50,
              child: const Center(
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: fontSize2, color: primaryColor),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
