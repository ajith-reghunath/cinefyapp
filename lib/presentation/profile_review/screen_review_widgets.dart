import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/presentation/selected/screen_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors.dart';
import '../../core/fontSize.dart';
import '../common widgets/common_widgets.dart';

class ScreenReviewWidgets {
  Future<dynamic> bottomSheet(BuildContext context, double width) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0), // Adjust the top radius as needed
        )),
        builder: (BuildContext context) {
          return BlocBuilder<CastingCallBloc, CastingCallState>(
            builder: (context, state) {
              return SizedBox(
                        // height: 0.3 * height,
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        sizedBox1(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Would you like to end the selection process? , After clicking yes, you won\'t be able to review any profiles other than the selected ones.',
                            style: TextStyle(fontSize: 18),
                          ),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return ScreenSelected(title: 'Selected Profiles',applicantsList: state.selectedApplicants);
                                              }));
                                      // context.read<CastingCallBloc>().add(
                                      //     ApplyCastingCall(
                                      //         postID: castingState
                                      //             .castingCallList![index].sId!));
                                      // context
                                      //     .read<CastingCallBloc>()
                                      //     .add(LoadCastingCall());
                                      // Navigator.pop(context);
                                      // showSnackBar(context, 'Your profile is submitted');
                                      // castingState.appliedCastingCallList
                                      //     .add(castingState.castingCallList![index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: secondaryColor,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 20),
                                        child: Text(
                                          'Yes, Proceed',
                                          style: TextStyle(
                                              fontSize: fontSize2, color: primaryColor),
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
                                          border: Border.all(width: 1, color: shade3)),
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
            },
          );
        });
  }
}
