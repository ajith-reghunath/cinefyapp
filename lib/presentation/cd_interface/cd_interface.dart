// ignore_for_file: must_be_immutable

import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/casting%20call%20card/castingCallCard.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../profile_review/screen_review.dart';

class CastingDirectorInterface extends StatelessWidget {
  CastingDirectorInterface({super.key, required this.index});
  int index;
  int call = 1;
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CastingCallBloc, CastingCallState>(
          builder: (context, state) {
            if (state.castingCallList![index].applicants!.isEmpty) {
              return const Text('No applicants');
            } else {
              if (state.selectedApplicants.isEmpty &&
                  state.rejectedApplicants.isEmpty &&
                  state.unreviewedApplicants.isEmpty) {
                return Column(
                  children: [
                    const CircularProgressIndicator(),
                    TextButton(
                      child: Text('press me'),
                      onPressed: () {
                        print(state.unreviewedApplicants.length);
                      },
                    )
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CastingCallBloc>()
                                      .add(RemoveFromSortedList());
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back)),
                          ),
                        ],
                      ),
                      cdInterfaceCastingcallCard(
                        context: context,
                        title: state.castingCallList![index].title,
                        roles: state.castingCallList![index].roles,
                        type: state.castingCallList![index].projectType,
                        imageUrl:
                            'https://app.nex-gen.shop/${state.castingCallList![index].image}',
                        language:
                            state.castingCallList![index].language!.isEmpty
                                ? 'not given'
                                : state.castingCallList![index].language![0]
                                    .toString(),
                      ),
                      sizedBoxH20(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ScreenReview(title: 'Unreviewed',);
                                  }),
                                );
                              },
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: shade4),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Center(
                                            child: Text(
                                          state.unreviewedApplicants.length
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: 'PoppinsSemiBold',
                                              fontSize: 28,
                                              color: accentColor),
                                        ))),
                                    sizedBoxW20(),
                                    Container(
                                      width: 180,
                                      height: 20,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Unreviewed Profiles',
                                        style: TextStyle(
                                            color: shade2, fontSize: fontSize4),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            sizedBoxH15(),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: shade4),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        state.selectedApplicants.length
                                            .toString(),
                                        style: const TextStyle(
                                            fontFamily: 'PoppinsSemiBold',
                                            fontSize: 28,
                                            color: greenColor),
                                      ))),
                                  sizedBoxW20(),
                                  Container(
                                    width: 180,
                                    height: 20,
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Selected Profiles',
                                      style: TextStyle(
                                          color: shade2, fontSize: fontSize4),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            sizedBoxH15(),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: shade4),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        state.rejectedApplicants.length
                                            .toString(),
                                        style: const TextStyle(
                                            fontFamily: 'PoppinsSemiBold',
                                            fontSize: 28,
                                            color: redcolor),
                                      ))),
                                  sizedBoxW20(),
                                  Container(
                                    width: 180,
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Rejected Profiles',
                                      style: TextStyle(
                                          color: shade2, fontSize: fontSize4),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
