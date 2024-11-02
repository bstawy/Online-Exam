import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width, height, borderRadius;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? color, textColor, disabledColor, borderColor;

  const CustomButton({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.text,
    this.textStyle,
    this.child,
    this.color,
    this.textColor,
    this.disabledColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 48.h),
        backgroundColor: color ?? ColorsManager.blue,
        disabledBackgroundColor: disabledColor ?? ColorsManager.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
          side: BorderSide(
            color: borderColor ?? ColorsManager.blue,
            width: 1.w,
          ),
        ),
      ),
      child: Text(
        text ?? '',
        style: textStyle ??
            TextStyles.font16LightWhiteMedium.copyWith(
              color: textColor ?? ColorsManager.lightWhite,
            ),
      ),
    );
  }
}
