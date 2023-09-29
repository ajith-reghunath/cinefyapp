import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/fontSize.dart';
import '../../../core/global_variables.dart';
import '../../common widgets/common_widgets.dart';
import '../../main_page/cd_mainpage.dart';

// ignore: must_be_immutable
class CdNotFoundScreen extends StatelessWidget {
  CdNotFoundScreen(
      {super.key, required this.height, required this.width, this.name});
  double width;
  double height;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxH20(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    const Text(
                      'Hello ',
                      style: TextStyle(
                          fontSize: fontSize1,
                          color: shade2,
                          fontFamily: 'PoppinsMedium'),
                    ),
                    Text(
                      name ?? 'casting director',
                      style: const TextStyle(
                          fontSize: fontSize1,
                          color: accentColor,
                          fontFamily: 'PoppinsMedium'),
                    )
                  ],
                ),
              ),
              sizedBoxH10(),
            ],
          ),
        ),
        SizedBox(
            width: width,
            height: height,
            child: Center(
                child: Column(
              children: [
                Image.asset('assets/images/create.png',scale: 0.1,),
                ElevatedButton(onPressed: (){indexChangeNotifier = ValueNotifier(1);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ScreenCastingDirectorMainPage();
                      }));},style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)) ,child: const Text('Create a Casting Call',style: TextStyle(fontSize: fontSize2),)),
              ],
            ))),
      ],
    );
  }
}
