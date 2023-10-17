import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../profile/screen_profile_widgets.dart';

class ArtistProfile extends StatelessWidget {
  const ArtistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: primaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: secondaryColor,
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    height: width,
                    color: accentColor,
                  ),
                  sizedBoxH20(),
                  const Text(
                    'Sankar',
                    style: TextStyle(
                        fontSize: fontSize7,
                        color: secondaryColor,
                        fontFamily: 'PoppinsSemiBold'),
                  ),
                  sizedBoxH20(),
                  const Text(
                    'Age : 24 Years',
                    style: TextStyle(fontSize: fontSize2, color: shade2),
                  ),
                  sizedBoxH10(),
                  const Text(
                    'Place : Kochi',
                    style: TextStyle(fontSize: fontSize2, color: shade2),
                  ),
                  sizedBoxH10(),
                  const Text(
                    'Gender : Male',
                    style: TextStyle(fontSize: fontSize2, color: shade2),
                  ),
                  sizedBoxH20(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio',
                        style: TextStyle(color: shade2),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: shade4),
                              borderRadius: BorderRadius.circular(7)),
                          child: const Text('data')),
                    ],
                  ),
                  sizedBoxH15(),
                  SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Interests',
                          style: TextStyle(color: shade2),
                        ),
                        Wrap(
                            children: [
                          'acting',
                          'dancing',
                          'singing',
                          'cinematography'
                        ].map((e) => displayTag(e)).toList()),
                      ],
                    ),
                  ),
                  sizedBoxH15(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Work Experience',
                        style: TextStyle(color: shade2),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: shade4),
                              borderRadius: BorderRadius.circular(7)),
                          child: const Text('data')),
                    ],
                  ),
                  sizedBoxH15(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Skills',
                        style: TextStyle(color: shade2),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: shade4),
                              borderRadius: BorderRadius.circular(7)),
                          child: const Text('data')),
                    ],
                  ),
                  sizedBoxH15(),
                  SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Languages',
                          style: TextStyle(color: shade2),
                        ),
                        Wrap(
                            children: ['English', 'Malayalam', 'Tamil']
                                .map((e) => displayTag(e))
                                .toList()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70)
                  // imageContainer(
                  //       width,
                  //       NetworkImage(
                  //           'https://app.nex-gen.shop/dp/${userState.photo}'));
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 170, 13, 13),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                    width: 15,
                  ),
                  sizedBoxW20(),
                  const Text(
                    'Reject',
                    style: TextStyle(fontSize: fontSize2, color: primaryColor),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.keyboard_double_arrow_left,
                  color: primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  // Do something
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_right,
                  color: primaryColor,
                  size: 30,
                ),
                onPressed: () {
                  // Do something
                },
              ),
              Row(
                children: [
                  const Text(
                    'Select',
                    style: TextStyle(fontSize: fontSize2, color: primaryColor),
                  ),
                  sizedBoxW20(),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 113, 64),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // SingleChildScrollView(
      //   padding: const EdgeInsets.all(10),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 20),
      //         child:
      // IconButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: const Icon(Icons.arrow_back)),
      //       ),
      //       Container(
      //         width: width,
      //         height: width,
      //         color: accentColor,
      //       )
      //       // imageContainer(
      //       //       width,
      //       //       NetworkImage(
      //       //           'https://app.nex-gen.shop/dp/${userState.photo}'));
      //     ],
      //   ),
      // ),
    );
  }
}
