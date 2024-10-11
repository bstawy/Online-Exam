import 'package:flutter/material.dart';

import '../../main.dart';

void showErrorDialog(String? errorMsg) async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => ErrorDialog(errorMsg),
  );
}

class ErrorDialog extends StatelessWidget {
  final String? errorMsg;
  const ErrorDialog(this.errorMsg, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(errorMsg ?? 'An error occurred'),
    );
  }
}
