// ignore_for_file: must_be_immutable

import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/presentation/cd_interface/cd_interface_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/casting%20call%20card/castingCallCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';

class CastingDirectorInterface extends StatelessWidget {
  CastingDirectorInterface({super.key, required this.index});
  int index;
  int call = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    CdInterfaceWidget cdInterfaceWidget =
        CdInterfaceWidget(width: width, context: context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CastingCallBloc, CastingCallState>(
          builder: (context, state) {
            if (state.createdCastingCallList![index].applicants!.isEmpty) {
              return const Text('No applicants');
            } else {
              if (state.selectedApplicants.isEmpty &&
                  state.rejectedApplicants.isEmpty &&
                  state.unreviewedApplicants.isEmpty && state.bookmarkedApplicants.isEmpty && state.reviewedApplicants.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: accentColor,
                ));
              } else {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      shadowColor: Colors.transparent,
                      pinned: true,
                      backgroundColor: primaryColor,
                      leading: IconButton(
                          color: secondaryColor,
                          onPressed: () {
                            context
                                .read<CastingCallBloc>()
                                .add(RemoveFromSortedList());
                            context
                                .read<CastingCallBloc>()
                                .add(LoadCreatedCastingCall());
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: cdInterfaceCastingcallCard(
                              context: context,
                              title: state.createdCastingCallList![index].title,
                              roles: state.createdCastingCallList![index].roles,
                              type: state
                                  .createdCastingCallList![index].projectType,
                              imageUrl:
                                  'https://app.nex-gen.shop/${state.createdCastingCallList![index].image}',
                              language: state.createdCastingCallList![index]
                                      .language!.isEmpty
                                  ? 'not given'
                                  : state.createdCastingCallList![index]
                                      .language![0]
                                      .toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList.list(children: [
                      cdInterfaceWidget.countWidget(
                          title: 'Unreviewed',
                          color: const Color(0xffC5CAFF),
                          applicantsList: state.unreviewedApplicants,
                          castingCallIndex: index),
                      cdInterfaceWidget.countWidget(
                          title: 'Pending',
                          color: const Color(0xffFBD5A9),
                          applicantsList: state.reviewedApplicants,
                          castingCallIndex: index),
                      cdInterfaceWidget.countWidget(
                          title: 'Selected',
                          color: const Color(0xffA2EDD3),
                          applicantsList: state.selectedApplicants,
                          castingCallIndex: index),
                      cdInterfaceWidget.countWidget(
                          title: 'Rejected',
                          color: const Color(0xffFEC9C9),
                          applicantsList: state.rejectedApplicants,
                          castingCallIndex: index),
                      cdInterfaceWidget.countWidget(
                          title: 'Bookmarked',
                          color: const Color(0xffFBECA9),
                          applicantsList: state.bookmarkedApplicants,
                          castingCallIndex: index)
                    ]),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
