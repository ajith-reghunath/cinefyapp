import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
        title: screenTitle('Privacy Policy'),
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
                  text:
                      'Effective Date: 24 October, 2023\n',
                  style: TextStyle(
                      fontSize: fontSize2,
                      color: secondaryColor,
                      fontFamily: 'PoppinsRegular'),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n1. Introduction\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nWe cinefy values your privacy and is committed to protecting your personal information. This Privacy Policy describes how we collect, use, disclose, and protect the information we collect through the cinefy app.\n'),
                    TextSpan(
                        text: '\n2. Information We Collect\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\n2.1. '),
                    TextSpan(
                        text: 'User Account Information\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> When you register an account, we collect your email address and mobile phone number. Mobile numbers are verified through a one-time password (OTP) process.\n'),
                    TextSpan(text: '\n2.2. '),
                    TextSpan(
                        text: 'User-Generated Content\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> We collect the information you provide when creating a profile, including your name, age, gender, interests, and images.\n'),
                    TextSpan(text: '\n2.3. '),
                    TextSpan(
                        text: 'Casting Call Data\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Casting Directors provide information about casting calls, which may include descriptions, requirements, and application details.\n'),
                    TextSpan(text: '\n2.4. '),
                    TextSpan(
                        text: 'Communication Data\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Information exchanged through the App\'s chat feature.\n'),
                    TextSpan(
                        text: '\n3. How We Use Your Information\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nWe use the collected information for the following purposes:\n'),
                    TextSpan(
                        text:
                            '\n> To provide and maintain the App\'s services.\n> To communicate with users, including notifications about casting calls and updates.\n> To facilitate interactions between Acting Aspirants and Casting Directors.\n> To improve the App\'s functionality and user experience.\n> To address legal and security requirements.\n'),
                    TextSpan(
                        text: '\n4. Information Sharing\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nWe may share your information with the following parties:\n'),
                    TextSpan(
                        text:
                            '\n> Casting Directors : ',style: TextStyle(fontWeight: FontWeight.bold)),   
                    TextSpan(
                        text:
                            'Acting Aspirants\' profile information is shared with Casting Directors when they apply for casting calls.\n'),
                    TextSpan(
                        text: '\n5. Your Choices\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nYou have the following options:\n'),
                    TextSpan(
                        text:
                            '\n> Access and Correction : ',style: TextStyle(fontWeight: FontWeight.bold)),
                        
                    TextSpan(
                        text:
                            'You can access and edit your profile information.\n'),
                    TextSpan(
                        text: '\n6. Security\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nWe employ reasonable security measures to protect your data from unauthorized access, disclosure, alteration, or destruction.\n'),
                    TextSpan(
                        text: '\n7. Changes to this Privacy Policy\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nWe may update this Privacy Policy to reflect changes in how we handle your information. Any updates will be posted on the App.\n'),
                    TextSpan(
                        text: '\n8. Contact Information\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\nIf you have questions or concerns about this Privacy Policy, please contact us at artistoclub.101@gmail.com.\n'),
                    
                   
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