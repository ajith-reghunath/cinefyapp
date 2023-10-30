import 'package:cinefy/core/colors.dart';
import 'package:cinefy/core/fontSize.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
        title: screenTitle('Terms and Conditions'),
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
                      'These Terms and Conditions ("Terms") govern your use of the Cinefy app. By accessing and using the App, you agree to comply with and be bound by these Terms. If you do not agree with these Terms, please refrain from using the App.\n',
                  style: TextStyle(
                      fontSize: fontSize2,
                      color: secondaryColor,
                      fontFamily: 'PoppinsRegular'),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n1. Acceptance of Terms\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nBy using the App, you acknowledge that you have read and understood these Terms and agree to be bound by them. If you do not agree to these Terms, please do not use the App.\n'),
                    TextSpan(
                        text: '\n2. User Registration and Verification\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\n2.1. '),
                    TextSpan(
                        text: 'Account Types\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> The App is intended for two types of users: Acting Aspirants and Casting Directors.\n> Users are required to create an account using a valid email address and mobile phone number.\n> Mobile phone numbers will be verified using a one-time password (OTP) sent to the provided number.\n'),
                    TextSpan(text: '\n2.2. '),
                    TextSpan(
                        text: 'Account Security\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Users are responsible for maintaining the confidentiality of their account information and password.\n> Users must promptly report any unauthorized access or security breaches.\n'),
                    TextSpan(
                        text: '\n3.User Profiles\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(text: '\n3.1. '),
                    TextSpan(
                        text: 'Acting Aspirants\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Acting Aspirants can create profiles with their name, age, gender, interests, and images.\n> Images uploaded must comply with our image content guidelines \n'),
                    TextSpan(text: '\n3.2. '),
                    TextSpan(
                        text: 'Casting Directors\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Casting Directors can create casting calls, which will be published to the Acting Aspirants.\n'),
                    TextSpan(
                        text: '\n4. Applying for casting calls\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Acting Aspirants can apply for casting calls by sharing their profiles with Casting Directors.\n> Casting Directors can review profiles to select suitable applicants.\n'),
                    TextSpan(
                        text: '\n5. Communication\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> Casting Directors can initiate conversations with selected applicants via the App\'s chat feature.\n'),
                    TextSpan(
                        text: '\n6. Content Guidelines\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> All users are expected to adhere to our content guidelines, which include but are not limited to:\n> No offensive or harmful content.\n> Respect for others\' rights, including intellectual property.\n> No attempts to disrupt or damage the App\'s functionality or security.\n'),
                    TextSpan(
                        text: '\n7. Data Privacy\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\nYour use of the App is also governed by our Privacy Policy, which can be found [provide a link]. Please review this policy to understand how we collect, use, and protect your personal information.\n'),
                    TextSpan(
                        text: '\n8. Termination\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> We reserve the right to terminate or suspend any user\'s access to the App at our discretion, without prior notice, for violations of these Terms.\n'),
                    TextSpan(
                        text: '\n9. Changes to Terms and App\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> We may update these Terms at any time, and we will notify users of significant changes. Your continued use of the App after any changes will signify your acceptance of the new Terms.\n'),
                    TextSpan(
                        text: '\n10. Disclaimer and Limitation of Liability\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> The App is provided "as is" without any warranties or guarantees. We are not responsible for any content posted by users.We are not liable for any direct, indirect, incidental, special, or consequential damages resulting from your use of the App\n'),
                    TextSpan(
                        text: '\n11. Contact Information\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor)),
                    TextSpan(
                        text:
                            '\n> If you have any questions or concerns about these Terms, you can contact us at artistoclub.101@gmail.com\n'),
                   
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
