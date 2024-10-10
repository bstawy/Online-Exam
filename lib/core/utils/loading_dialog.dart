import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

void showLoading() async {
  return await showDialog(
    context: navKey.currentContext!,
    builder: (context) => const LoadingDialog(),
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 100.w,
        height: 100.h,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
