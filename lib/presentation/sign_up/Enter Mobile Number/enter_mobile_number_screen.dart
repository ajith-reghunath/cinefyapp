import 'package:cinefy/presentation/sign_up/Enter%20Mobile%20Number/enter_mobile_number_widgets.dart';
import 'package:flutter/material.dart';

class EnterMobileNumberScreen extends StatelessWidget {
  const EnterMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: MediaQuery.of(context).size.height*0.20,), enterMobileNumberForm(width)],
          ),
        ),
      ),
    );
  }
}
