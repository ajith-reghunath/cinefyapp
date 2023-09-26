import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/main_page/widgets/cd_bottom_nav.dart';
import 'package:flutter/material.dart';

import '../create_cc/screen_cc.dart';
import '../home/cd_screen_home.dart';
import '../status_screen/status_screen.dart';

// ignore: must_be_immutable
class ScreenCastingDirectorMainPage extends StatelessWidget {
 ScreenCastingDirectorMainPage({Key? key}) : super(key: key);


  final _pages = [
    ScreenCdHome(),
    const ScreenCreateCastingCall(),
    const StatusScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: ((context, int value, child) {
            return _pages[value];
          })),
      bottomNavigationBar: const CdBottomNav(),
    );
  }
}
