import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: secondaryColor,
            )),
        centerTitle: true,
        title: screenTitle('About Us'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxH20(),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: fontSize2,
                      color: secondaryColor,
                      fontFamily: 'PoppinsRegular'),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\nAbout Cinefy\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nWelcome to Cinefy, where aspiring actors and casting directors come together to create cinematic magic. Our app is designed to simplify the casting process and connect talented actors with industry professionals. Learn more about cinefy.\n'),
                    TextSpan(
                        text: '\nOur Mission\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nAt Cinefy, our mission is to bridge the gap between aspiring actors and casting directors, making the casting process more accessible, efficient, and enjoyable. We believe that talent deserves a platform to shine, and casting directors should have the tools to discover the best talent.\n'),
                    TextSpan(
                        text: '\nKey Features\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text: '\n> Casting Calls : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Casting directors can create casting calls, and aspiring actors can apply directly through the app.\n'),
                    TextSpan(
                        text: '\n> Profile Creation : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Aspiring actors can build profiles, showcasing their skills, interests, and images.\n'),
                    TextSpan(
                        text: '\n> In-App Communication : ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Our app features a user-friendly chat system for seamless communication between casting directors and actors.\n'),
                    TextSpan(
                        text: '\nMeet the Creator\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nCinefy was developed by Ajith Reghunath a passionate app developer to creating a better experience for the entertainment industry.\nEmail : ajithreghunath101@gmail.com\n'),
                    TextSpan(
                        text: '\nThank You\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nThank you for choosing Cinefy. We\'re excited to be a part of your journey in the entertainment world. Whether you\'re an aspiring actor looking for your big break or a casting director seeking top talent, we\'re here to help make your dreams a reality.\n'),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
