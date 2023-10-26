import 'package:cinefy/core/colors.dart';
import 'package:flutter/material.dart';

import '../../core/fontSize.dart';
import '../../domain/created_casting_call/created_casting_call_model.dart';
import '../profile_review/screen_review.dart';

class CdInterfaceWidget {
  CdInterfaceWidget({required this.width, required this.context});
  double width;
  BuildContext context;
  Widget countWidget({
    required String title,
    required Color? color,
    required List<Applicants> applicantsList,
    required int castingCallIndex,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return ScreenReview(
              castingCallIndex: castingCallIndex,
              title: title,
              applicantsList: applicantsList,
            );
          }),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 10),
        child: Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: shade5, width: 2),
              borderRadius: BorderRadius.circular(22),
              color: primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                  child: Center(
                    child: Text(
                      applicantsList.length.toString(),
                      style: const TextStyle(
                          fontFamily: 'PoppinsSemiBold',
                          fontSize: 28,
                          color: shade2),
                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  child: Center(
                      child: Text(
                    title,
                    style: const TextStyle(fontSize: fontSize4, color: shade1),
                  )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
