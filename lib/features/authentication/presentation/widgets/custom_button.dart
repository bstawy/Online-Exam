import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/theme_ext.dart';
import '../../../../core/theme/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width, height;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? color, disabledColor;

  const CustomButton({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.text,
    this.textStyle,
    this.child,
    this.color,
    this.disabledColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = context.colors;
    final customTextStyles = context.textStyles;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 48.h),
        backgroundColor: color ?? customColors.primary,
        disabledBackgroundColor: disabledColor ?? ColorsManager.lightGrey,
      ),
      child: Text(
        text ?? '',
        style: textStyle ?? customTextStyles.labelLarge,
      ),
    );
  }
}
