import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/ui_bloc/ui_bloc.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/artist_profile/artist_profile_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/created_casting_call/created_casting_call_model.dart';
import '../profile/screen_profile_widgets.dart';

// ignore: must_be_immutable
class ArtistProfile extends StatelessWidget {
  ArtistProfile(
      {super.key,
      required this.applicantsList,
      required this.index,
      required this.pageTitle,
      required this.castingCallIndex});
  int castingCallIndex;
  int index;
  String? pageTitle;
  List<Applicants>? applicantsList;
  String? keyValue;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        return BlocBuilder<UiBloc, UiState>(
          builder: (context, uiState) {
            uiState.profileIndex! >= 0
                ? keyValue = applicantsList![uiState.profileIndex!].user!.sId!
                : keyValue = null;
            return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      backgroundColor: primaryColor,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<CastingCallBloc>().add(ProfileAdded());
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: secondaryColor,
                          )),
                    ),
                    SliverToBoxAdapter(
                        child: uiState.profileIndex! >= 0
                            ? Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    imageContainer(
                                      width,
                                      state.applicants[keyValue]!.profile!
                                                  .photo ==
                                              null
                                          ? NetworkImage(state
                                              .applicants[keyValue]!
                                              .profilePic!)
                                          : NetworkImage(
                                              'https://app.nex-gen.shop/dp/${state.applicants[keyValue]!.profile!.photo}'),
                                    ),
                                    sizedBoxH20(),
                                    Text(
                                      '${state.applicants[keyValue]!.profile!.name}',
                                      style: const TextStyle(
                                          fontSize: fontSize7,
                                          color: secondaryColor,
                                          fontFamily: 'PoppinsSemiBold'),
                                    ),
                                    sizedBoxH20(),
                                    Text(
                                      'Age : ${state.applicants[keyValue]!.profile!.age}',
                                      style: const TextStyle(
                                          fontSize: fontSize2, color: shade2),
                                    ),
                                    sizedBoxH10(),
                                    const Text(
                                      'Place : Not available',
                                      style: TextStyle(
                                          fontSize: fontSize2, color: shade2),
                                    ),
                                    sizedBoxH10(),
                                    Text(
                                      'Gender : ${state.applicants[keyValue]!.profile!.gender}',
                                      style: const TextStyle(
                                          fontSize: fontSize2, color: shade2),
                                    ),
                                    sizedBoxH20(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Bio',
                                          style: TextStyle(color: shade2),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            width: width,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1, color: shade4),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Text(
                                              '${state.applicants[keyValue]!.profile!.bio}',
                                              style: const TextStyle(
                                                  fontSize: fontSize2),
                                            )),
                                      ],
                                    ),
                                    sizedBoxH15(),
                                    SizedBox(
                                      width: width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Interests',
                                            style: TextStyle(color: shade2),
                                          ),
                                          Wrap(
                                              children: state
                                                  .applicants[keyValue]!
                                                  .profile!
                                                  .roles!
                                                  .map((e) => displayTag(e))
                                                  .toList()),
                                        ],
                                      ),
                                    ),
                                    sizedBoxH15(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Work Experience',
                                          style: TextStyle(color: shade2),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            width: width,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1, color: shade4),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: const Text('No data')),
                                      ],
                                    ),
                                    sizedBoxH15(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Skills',
                                          style: TextStyle(color: shade2),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            width: width,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1, color: shade4),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: const Text('No data')),
                                      ],
                                    ),
                                    sizedBoxH15(),
                                    SizedBox(
                                      width: width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Languages',
                                            style: TextStyle(color: shade2),
                                          ),
                                          Wrap(
                                              children: state
                                                  .applicants[keyValue]!
                                                  .profile!
                                                  .languages!
                                                  .map((e) => displayTag(e))
                                                  .toList()),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 70)
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: height * 0.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/workdone.png',
                                      width: 0.7 * width,
                                    ),
                                    const Text(
                                      'No more profiles to review !',
                                      style: TextStyle(fontSize: fontSize4),
                                    )
                                  ],
                                ),
                              )),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: pageTitle == 'Selected Profiles'
                    ? const SizedBox()
                    : (uiState.profileIndex! >= 0
                        ? ArtistProfileWidgets().profileControlWidget(
                            title: pageTitle!,
                            width: width,
                            applicantsList: applicantsList,
                            castingCallIndex: castingCallIndex
                          )
                        : const SizedBox()));
          },
        );
      },
    );
  }
}
