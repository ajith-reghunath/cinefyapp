import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/domain/time_ago/time_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: TextButton(
                onPressed: () {
                  print(state.bookmark!.length);
                },
                child: const Text('click me')),
          ),
        );
      },
    );
  }
}
