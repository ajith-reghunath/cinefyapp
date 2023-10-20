import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/ui_bloc/ui_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../../core/fontSize.dart';
import '../../domain/created_casting_call/created_casting_call_model.dart';
import '../common widgets/common_widgets.dart';

class ArtistProfileWidgets {
  Widget profileControlWidget({
    required double width,
    required List<Applicants>? applicantsList,
    required String title,
  }) {
    late List<Applicants> group1;
    late List<Applicants> group2;
    late List<Applicants> group3;
    late List<Applicants> group4;
    late String leftButtonText;
    late Color leftButtonColor;
    late String rightFirstButtonText;
    late String rightSecondButtonText;
    late Color rightFirstButtonColor;
    late Color rightSecondButtonColor;
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        return BlocBuilder<UiBloc, UiState>(
          builder: (context, uiState) {
            switch (title) {
              case 'Unreviewed':
                group1 = state.unreviewedApplicants;
                group2 = state.rejectedApplicants;
                group3 = state.selectedApplicants;
                group4 = state.bookmarkedApplicants;
                leftButtonText = 'Reject';
                rightFirstButtonText = 'Select';
                rightSecondButtonText = 'Bookmark';
                leftButtonColor = const Color(0xffFEC9C9);
                rightFirstButtonColor= const Color(0xffA2EDD3);
                rightSecondButtonColor= const Color(0xffFBECA9);
                break;
              case 'Selected':
                group1 = state.selectedApplicants;
                group2 = state.rejectedApplicants;
                group3 = state.bookmarkedApplicants;
                group4 = state.reviewedApplicants;
                leftButtonText = 'Reject';
                rightFirstButtonText = 'Bookmark';
                rightSecondButtonText = 'Pending';
                leftButtonColor = const Color(0xffFEC9C9);
                rightFirstButtonColor= const Color(0xffFBECA9);
                rightSecondButtonColor= const Color(0xffFBD5A9);
                break;
              case 'Rejected':
                group1 = state.rejectedApplicants;
                group2 = state.reviewedApplicants;
                group3 = state.selectedApplicants;
                group4 = state.bookmarkedApplicants;
                leftButtonText = 'Pending';
                rightFirstButtonText = 'Select';
                rightSecondButtonText = 'Bookmark';
                leftButtonColor = const Color(0xffFBD5A9);
                rightFirstButtonColor= const Color(0xffA2EDD3);
                rightSecondButtonColor= const Color(0xffFBECA9);
                break;
              case 'Pending':
                group1 = state.reviewedApplicants;
                group2 = state.rejectedApplicants;
                group3 = state.selectedApplicants;
                group4 = state.bookmarkedApplicants;
                leftButtonText = 'Reject';
                rightFirstButtonText = 'Select';
                rightSecondButtonText = 'Bookmark';
                leftButtonColor = const Color(0xffFEC9C9);
                rightFirstButtonColor= const Color(0xffA2EDD3);
                rightSecondButtonColor= const Color(0xffFBECA9);
                break;
              case 'Bookmarked':
                group1 = state.bookmarkedApplicants;
                group2 = state.rejectedApplicants;
                group3 = state.selectedApplicants;
                group4 = state.reviewedApplicants;
                leftButtonText = 'Reject';
                rightFirstButtonText = 'Select';
                rightSecondButtonText = 'Pending';
                leftButtonColor = const Color(0xffFEC9C9);
                rightFirstButtonColor= const Color(0xffA2EDD3);
                rightSecondButtonColor= const Color(0xffFBD5A9);
                break;
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 50,
                width: width,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (group2.contains(
                                applicantsList![uiState.profileIndex!]) ==
                            false) {
                          group2.add(applicantsList[uiState.profileIndex!]);
                          uiState.profileIndex! == applicantsList.length - 1
                              ? context.read<UiBloc>().add(ProfileIndexChanged(
                                  profileIndex: uiState.profileIndex! - 1))
                              : context.read<UiBloc>().add(ProfileIndexChanged(
                                  profileIndex: uiState.profileIndex!));
                          group1.remove(applicantsList[uiState.profileIndex!]);
                        }
                      },
                      child: Row(
                        children: [
                          sizedBoxW20(),
                          Container(
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: leftButtonColor,
                            ),
                          ),
                          sizedBoxW10(),
                          Text(
                            leftButtonText,
                            style: const TextStyle(
                                fontSize: fontSize2, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_double_arrow_left,
                        color:
                            uiState.profileIndex! == 0 ? shade3 : primaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (uiState.profileIndex! - 1 >= 0) {
                          context.read<UiBloc>().add(ProfileIndexChanged(
                              profileIndex: uiState.profileIndex! - 1));
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_double_arrow_right,
                        color:
                            uiState.profileIndex! == applicantsList!.length - 1
                                ? shade3
                                : primaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        if (uiState.profileIndex! + 1 < applicantsList.length) {
                          if (title == 'Unreviewed') {
                            state.reviewedApplicants
                                .add(applicantsList[uiState.profileIndex!]);
                            uiState.profileIndex! == applicantsList.length - 1
                                ? context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex:
                                            uiState.profileIndex! - 1))
                                : context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex: uiState.profileIndex!));
                            group1
                                .remove(applicantsList[uiState.profileIndex!]);
                          } else {
                            context.read<UiBloc>().add(ProfileIndexChanged(
                                profileIndex: uiState.profileIndex! + 1));
                          }
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        if (uiState.longpressIndex == 1) {
                          if (group3.contains(
                                  applicantsList[uiState.profileIndex!]) ==
                              false) {
                            group3.add(applicantsList[uiState.profileIndex!]);
                            uiState.profileIndex! == applicantsList.length - 1
                                ? context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex:
                                            uiState.profileIndex! - 1))
                                : context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex: uiState.profileIndex!));
                            group1
                                .remove(applicantsList[uiState.profileIndex!]);
                          }
                        } else {
                          if (group4.contains(
                                  applicantsList[uiState.profileIndex!]) ==
                              false) {
                            group4.add(applicantsList[uiState.profileIndex!]);
                            uiState.profileIndex! == applicantsList.length - 1
                                ? context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex:
                                            uiState.profileIndex! - 1))
                                : context.read<UiBloc>().add(
                                    ProfileIndexChanged(
                                        profileIndex: uiState.profileIndex!));
                            group1
                                .remove(applicantsList[uiState.profileIndex!]);
                          }
                        }
                      },
                      onLongPress: () {
                        context.read<UiBloc>().add(
                            ButtonLongPressed(index: -uiState.longpressIndex));
                      },
                      child: uiState.longpressIndex == 1
                          ? Row(
                              children: [
                                Text(
                                  rightFirstButtonText,
                                  style: const TextStyle(
                                      fontSize: fontSize2, color: primaryColor),
                                ),
                                sizedBoxW10(),
                                Container(
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: rightFirstButtonColor,
                                  ),
                                ),
                                sizedBoxW20(),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  rightSecondButtonText,
                                  style: const TextStyle(
                                      fontSize: fontSize2, color: primaryColor),
                                ),
                                sizedBoxW10(),
                                Container(
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: rightSecondButtonColor,
                                  ),
                                ),
                                sizedBoxW20(),
                              ],
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
}
