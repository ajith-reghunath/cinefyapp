import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/presentation/applied/screen_applied.dart';
import 'package:cinefy/presentation/bookmarks/screen_bookmark.dart';
import 'package:cinefy/presentation/chat/screen_chat.dart';
import 'package:cinefy/presentation/home/screen_home.dart';
import 'package:cinefy/presentation/main_page/widgets/bottom_nav.dart';
import 'package:cinefy/presentation/profile/screen_profile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);


  final _pages = [
    ScreenHome(),
    const ScreenBookmark(),
    const ScreenApplied(),
    const ScreenChat(),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: ((context, int value, child) {
            return _pages[value];
          })),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
