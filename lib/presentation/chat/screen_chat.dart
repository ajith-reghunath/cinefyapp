import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Chat'),
      ),
    );
  }
}