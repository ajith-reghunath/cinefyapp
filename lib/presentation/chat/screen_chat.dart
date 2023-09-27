import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/domain/time_ago/time_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: TextButton(
                onPressed: () {
                  String time = '2023-07-17T20:01:22.537Z';
                  print(TimeDisplay().getTime(time));
                },
                child: const Text('click me')),
          ),
        );
      },
    );
  }
}
