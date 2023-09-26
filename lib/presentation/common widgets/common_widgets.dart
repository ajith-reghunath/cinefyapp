import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/fontSize.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget mainIcons(double width, String assetFile) {
  return Image(
    image: AssetImage(
      assetFile,
    ),
    width: width * 0.4,
    height: width * 0.4,
  );
}

Widget titleText(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: secondaryColor,
        fontSize: fontSize1,
        fontFamily: 'PoppinsSemiBold'),
  );
}

Widget screenTitle(String text) {
  return Text(
    text,
    style: const TextStyle(
        fontFamily: 'PoppinsSemiBold',
        fontSize: fontSize7,
        color: secondaryColor),
  );
}

//sized boxes

Widget sizedBox1() {
  return const SizedBox(height: 30);
}

Widget sizedBox2() {
  return const SizedBox(height: 5);
}

Widget sizedBox3() {
  return const SizedBox(height: 25);
}

Widget sizedBox4() {
  return const SizedBox(
    height: 12,
  );
}

Widget sizedBox5() {
  return const SizedBox(
    height: 90,
  );
}

Widget sizedBoxH50() {
  return const SizedBox(
    height: 50,
  );
}

Widget sizedBoxH10() {
  return const SizedBox(
    height: 10,
  );
}

Widget sizedBoxW10() {
  return const SizedBox(
    width: 10,
  );
}

Widget sizedBoxW20() {
  return const SizedBox(
    width: 20,
  );
}

Widget divider() {
  return Container(
    height: 1.0,
    color: shade4,
  );
}

Widget sizedBoxH20() {
  return const SizedBox(
    height: 20,
  );
}

Widget sizedBoxH15() {
  return const SizedBox(
    height: 15,
  );
}


