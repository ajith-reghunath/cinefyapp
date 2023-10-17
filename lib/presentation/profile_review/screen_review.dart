import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/fontSize.dart';
import '../artist_profile/artist_profile.dart';

// ignore: must_be_immutable
class ScreenReview extends StatelessWidget {
  ScreenReview({super.key, this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              screenTitle(title!),
              const SizedBox(width: 40)
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ArtistProfile();
                          }),
                        );
                      },
                      child: Container(
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: shade4),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: accentColor,
                                  radius: 35,
                                ),
                                SizedBox(
                                  width: 0.5 * width,
                                  child: const Text(
                                    'Sankar',
                                    style: TextStyle(fontSize: fontSize4),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
                itemCount: 2),
          )
        ],
      )),
    );
  }
}
