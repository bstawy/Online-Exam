import 'package:flutter/material.dart';
import 'package:online_exam/core/theme/colors_manager.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff02369C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: ColorsManager.blue,
                )
              : const Text('Login',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
