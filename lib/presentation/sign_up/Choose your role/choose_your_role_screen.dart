import 'package:cinefy/presentation/sign_up/Choose%20your%20role/choose_your_role_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ChooseYourRoleScreen extends StatelessWidget {
  const ChooseYourRoleScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [mainIcons(width, 'assets/images/choose.png'),titleText('Choose Your Role'),sizedBox3(),description(),sizedBox3(),userButton(width), sizedBox4(),recruiterButton(),sizedBox3(),chooseYourRoleContinueButton(width)],
            ),
        ),
      ),
    );
  }
}