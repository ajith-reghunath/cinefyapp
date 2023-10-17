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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CastingCallBloc, CastingCallState>(
          builder: (context, state) {
            if (state.createdCastingCallList![index].applicants!.isEmpty) {
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
                    SliverGrid(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ScreenReview(
                                      title: 'Unreviewed',
                                    );
                                  }),
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: shade4),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      state.unreviewedApplicants.length
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'PoppinsSemiBold',
                                          fontSize: 35,
                                          color: accentColor),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      'Unreviewed',
                                      style: TextStyle(
                                          color: shade2, fontSize: fontSize4),
                                    ),
                                    sizedBoxH20()
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: shade4),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    '2',
                                    style: TextStyle(
                                        fontFamily: 'PoppinsSemiBold',
                                        fontSize: 35,
                                        color: secondaryColor),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Reviewed',
                                    style: TextStyle(
                                        color: shade2, fontSize: fontSize4),
                                  ),
                                  sizedBoxH20()
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: shade4),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    state.selectedApplicants.length.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'PoppinsSemiBold',
                                        fontSize: 35,
                                        color: greenColor),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Selected',
                                    style: TextStyle(
                                        color: shade2, fontSize: fontSize4),
                                  ),
                                  sizedBoxH20()
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15, bottom: 10),
                            child: GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: shade4),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      state.rejectedApplicants.length
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'PoppinsSemiBold',
                                          fontSize: 35,
                                          color: redcolor),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      'Rejected',
                                      style: TextStyle(
                                          color: shade2, fontSize: fontSize4),
                                    ),
                                    sizedBoxH20()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                        ))
                  ],
                );
                // SingleChildScrollView(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [

                //       sizedBoxH20(),
                //       Expanded(
                //         child: GridView.count(
                //           padding: EdgeInsets.symmetric(horizontal: 12),
                //           crossAxisCount: 2,
                //           primary: false,
                //           crossAxisSpacing: 10,
                //           mainAxisSpacing: 10,
                //           children: [

                //           ],
                //         ),
                //       )
                // SingleChildScrollView(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 45),
                //     child: Column(
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (BuildContext context) {
                //                 return ScreenReview(
                //                   title: 'Unreviewed',
                //                 );
                //               }),
                //             );
                //           },
                //           child: Container(
                //             height: 80,
                //             decoration: BoxDecoration(
                //                 border:
                //                     Border.all(width: 1, color: shade4),
                //                 borderRadius: BorderRadius.circular(7)),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 SizedBox(
                //                     width: 50,
                //                     height: 50,
                //                     child: Center(
                //                         child: Text(
                //                       state.unreviewedApplicants.length
                //                           .toString(),
                //                       style: const TextStyle(
                //                           fontFamily: 'PoppinsSemiBold',
                //                           fontSize: 28,
                //                           color: accentColor),
                //                     ))),
                //                 sizedBoxW20(),
                //                 Container(
                //                   width: 180,
                //                   height: 20,
                //                   alignment: Alignment.centerLeft,
                //                   child: const Text(
                //                     'Unreviewed Profiles',
                //                     style: TextStyle(
                //                         color: shade2,
                //                         fontSize: fontSize4),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //         sizedBoxH15(),
                //         Container(
                //           height: 80,
                //           decoration: BoxDecoration(
                //               border: Border.all(width: 1, color: shade4),
                //               borderRadius: BorderRadius.circular(7)),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               const SizedBox(
                //                 width: 15,
                //               ),
                //               SizedBox(
                //                   width: 50,
                //                   height: 50,
                //                   child: Center(
                //                       child: Text(
                //                     state.selectedApplicants.length
                //                         .toString(),
                //                     style: const TextStyle(
                //                         fontFamily: 'PoppinsSemiBold',
                //                         fontSize: 28,
                //                         color: greenColor),
                //                   ))),
                //               sizedBoxW20(),
                //               Container(
                //                 width: 180,
                //                 height: 20,
                //                 alignment: Alignment.centerLeft,
                //                 child: const Text(
                //                   'Selected Profiles',
                //                   style: TextStyle(
                //                       color: shade2, fontSize: fontSize4),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         sizedBoxH15(),
                //         Container(
                //           height: 80,
                //           decoration: BoxDecoration(
                //               border: Border.all(width: 1, color: shade4),
                //               borderRadius: BorderRadius.circular(7)),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               const SizedBox(
                //                 width: 15,
                //               ),
                //               SizedBox(
                //                   width: 50,
                //                   height: 50,
                //                   child: Center(
                //                       child: Text(
                //                     state.rejectedApplicants.length
                //                         .toString(),
                //                     style: const TextStyle(
                //                         fontFamily: 'PoppinsSemiBold',
                //                         fontSize: 28,
                //                         color: redcolor),
                //                   ))),
                //               sizedBoxW20(),
                //               Container(
                //                 width: 180,
                //                 height: 40,
                //                 alignment: Alignment.centerLeft,
                //                 child: const Text(
                //                   'Rejected Profiles',
                //                   style: TextStyle(
                //                       color: shade2, fontSize: fontSize4),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
                //     ],
                //   ),
                // );
              }
            }
          },
        ),
      ),
    );
  }
}
