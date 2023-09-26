import 'package:cinefy/core/constants.dart';
import 'package:cinefy/presentation/sign_up/Create%20new%20account/create_new_account_widgets.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(height: MediaQuery.of(context).size.height*0.15,),createNewAccountForm(createNewAccountFormKey,context),sizedBox1(),alreadyhaveAnAccount(),signIn(context)],
              ),
          ),
        ),
      ),
    );
  }
}