import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../common widgets/common_widgets.dart';

class ScreenBookmark extends StatelessWidget {
  const ScreenBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              children: [
          SizedBox(
            width: width,
            child: Center(child: screenTitle('Bookmarks')),
          ),
              ],
            ),
        ));
  }
}
