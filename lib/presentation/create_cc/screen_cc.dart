import 'package:cinefy/application/create_cc_bloc/bloc/create_cc_state.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:cinefy/presentation/create_cc/screen_cc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/create_cc_bloc/bloc/create_cc_bloc.dart';

class ScreenCreateCastingCall extends StatelessWidget {
  const ScreenCreateCastingCall({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<CreateCcBloc, CreateCcState>(
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 12, top: 20, right: 12,),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Center(child: screenTitle('Create Casting Call')),
              ),
              sizedBoxH20(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1.5, color: shade4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      child: Column(
                        children: [
                          projectType(),
                          sizedBoxH20(),
                          projectLanguage(),
                          sizedBoxH15(),
                          enterTitle(),
                          sizedBoxH15(),
                          castingCallTitle(),
                          sizedBoxH15(),
                          selectRole(),
                          sizedBoxH15(),
                          const AgeSliderWidget(),
                          sizedBoxH15(),
                          selectGender(),
                          sizedBoxH15(),
                          shortDescription(),
                          sizedBoxH15(),
                          projectDirector(),
                          sizedBoxH15(),
                          projectLocation(),
                          sizedBoxH15(),
                          castingCallPicture(width),
                          sizedBoxH20(),
                          submitButton(width, height)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       if (state.pickFile != null) {
              //         context.read<CreateCcBloc>().add(SubmitCastingCall());
              //       }
              //     },
              //     child: const Text('save'))
            ],
          ),
        ));
      },
    );
  }
}
