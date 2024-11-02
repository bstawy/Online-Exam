import 'package:flutter/material.dart';

class TimesUpScreen extends StatelessWidget {
  static const String routeName = '/times-up-screen';
  const TimesUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Times Up!'),
      ),
    );
  }
}
