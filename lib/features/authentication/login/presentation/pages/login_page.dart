import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading:
            IconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: () {}),
      ),
      body: const LoginForm(),
    );
  }
}