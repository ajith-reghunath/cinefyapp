import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:flutter/material.dart';

class CdBottomNav extends StatelessWidget {
  const CdBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: ((context, int newValue, child) {
        return BottomNavigationBar(
          currentIndex: newValue,
          onTap: ((index) => indexChangeNotifier.value = index),
          items: [
            bottomNavItem(Icons.home_outlined, Icons.home_sharp, screenWidth),
            bottomNavItem(Icons.add_box_outlined, Icons.add_box, screenWidth),
            bottomNavItem(Icons.messenger_outline, Icons.messenger, screenWidth),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: shade6,
        );
      }),
    );
  }

  BottomNavigationBarItem bottomNavItem(
      IconData outlinedLogo, IconData solidLogo, double screenWidth) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Icon(
            outlinedLogo,
            color: secondaryColor,
            size: 0.07 * screenWidth,
          ),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Icon(
            solidLogo,
            color: secondaryColor,
            size: 0.07 * screenWidth,
          ),
        ),
        label: '');
  }
}
