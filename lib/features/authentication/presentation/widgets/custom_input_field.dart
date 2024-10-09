import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint, label;
  final String? initialTextValue, obscuringCharacter;
  final int? maxLength, maxLines, minLines, errorMaxLines;
  final bool? enabled, isPassword, isFilled;
  final TextStyle? inputTextStyle, hintStyle, labelStyle, errorStyle;
  final Color? backgroundColor, disabledBackgroundColor, suffixIconColor;
  final InputBorder? border,
      enabledBorder,
      focusedBorder,
      disabledBorder,
      errorBorder,
      focusedErrorBorder;
  final Color? borderColor,
      enabledBorderColor,
      focusedBorderColor,
      errorBorderColor,
      focusedErrorBorderColor;
  final double? borderWidth,
      enabledBorderWidth,
      focusedBorderWidth,
      disabledBorderWidth,
      errorBorderWidth,
      focusedErrorBorderWidth;
  final double? borderRadius,
      enabledBorderRadius,
      focusedBorderRadius,
      disabledBorderRadius,
      errorBorderRadius,
      focusedErrorBorderRadius;
  final num? scrollPaddingValue;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextInputAction? action;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon, prefixIcon;
  final IconData? icon;
  final FocusNode? focusNode;

  const CustomInputField({
    super.key,
    required this.hint,
    this.action,
    this.autovalidateMode,
    this.border,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.controller,
    this.disabledBackgroundColor,
    this.disabledBorder,
    this.disabledBorderWidth,
    this.disabledBorderRadius,
    this.enabled,
    this.enabledBorder,
    this.enabledBorderColor,
    this.enabledBorderWidth,
    this.enabledBorderRadius,
    this.errorBorder,
    this.errorBorderColor,
    this.errorBorderWidth,
    this.errorBorderRadius,
    this.errorMaxLines,
    this.errorStyle,
    this.backgroundColor,
    this.focusNode,
    this.focusedBorder,
    this.focusedBorderColor,
    this.focusedBorderWidth,
    this.focusedBorderRadius,
    this.focusedErrorBorder,
    this.focusedErrorBorderColor,
    this.focusedErrorBorderWidth,
    this.focusedErrorBorderRadius,
    this.hintStyle,
    this.icon,
    this.initialTextValue,
    this.inputFormatters,
    this.isFilled,
    this.isPassword,
    this.keyboardType,
    required this.label,
    this.labelStyle,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.obscuringCharacter,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.contentPadding,
    this.prefixIcon,
    this.inputTextStyle,
    this.scrollPaddingValue,
    this.suffixIcon,
    this.suffixIconColor,
    this.validator,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool isTextObscured;
  int? maxLines;

  @override
  void initState() {
    super.initState();
    // MaxLines must equals 1 if obscureText is true
    if (widget.isPassword != null && widget.isPassword!) {
      isTextObscured = true;
      maxLines = 1;
    } else {
      isTextObscured = false;
      maxLines = widget.maxLines;
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyles = Theme.of(context).textTheme;

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialTextValue,
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: isTextObscured,
      obscuringCharacter: widget.obscuringCharacter ?? '*',
      maxLength: widget.maxLength,
      maxLines: maxLines,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.action ?? TextInputAction.next,
      scrollPadding: widget.scrollPaddingValue == null
          ? const EdgeInsets.all(20.0)
          : EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  (widget.scrollPaddingValue!)),
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      style: widget.inputTextStyle ??
          customTextStyles.bodyLarge?.copyWith(fontSize: 16.sp),
      decoration: InputDecoration(
        isDense: true, // Used to have full control on padding
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
        floatingLabelBehavior: FloatingLabelBehavior.always,

        label: Text(widget.label),
        labelStyle: widget.labelStyle ?? customTextStyles.bodyLarge,
        hintText: widget.hint,
        hintStyle: widget.hintStyle ??
            customTextStyles.bodyLarge?.copyWith(
              color: ColorsManager.lightGrey,
            ),
        alignLabelWithHint: true,
        fillColor: (widget.enabled != null && widget.enabled == false)
            ? widget.disabledBackgroundColor ?? ColorsManager.grey
            : widget.backgroundColor ?? Colors.white,
        filled: widget.isFilled ?? false,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: ColorsManager.lightGrey,
        suffixIcon: widget.isPassword ?? false
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isTextObscured = !isTextObscured;
                  });
                },
                child: Icon(
                  isTextObscured ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.suffixIcon,
        counterText: "",
        border: widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.r),
              borderSide: BorderSide(
                color: widget.borderColor ?? ColorsManager.grey,
                width: widget.borderWidth ?? 1.3,
              ),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.enabledBorderRadius ?? 4.r),
              borderSide: BorderSide(
                color: widget.enabledBorderColor ?? ColorsManager.grey,
                width: widget.enabledBorderWidth ?? 1.3,
              ),
            ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.focusedBorderRadius ?? 4.r),
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? ColorsManager.blue,
                width: widget.focusedBorderWidth ?? 1.3,
              ),
            ),
        disabledBorder: widget.disabledBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.disabledBorderRadius ?? 4.r),
              borderSide: BorderSide(
                color:
                    widget.disabledBackgroundColor ?? const Color(0xFFE6E6E6),
                width: widget.disabledBorderWidth ?? 1.3,
              ),
            ),
        errorStyle: widget.errorStyle ?? const TextStyle(color: Colors.red),
        errorMaxLines: widget.errorMaxLines ?? 4,
        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.errorBorderRadius ?? 4.r),
              borderSide: BorderSide(
                color: widget.errorBorderColor ?? Colors.red,
                width: widget.errorBorderWidth ?? 1.3,
              ),
            ),
        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.focusedErrorBorderRadius ?? 4.r),
              borderSide: BorderSide(
                color: widget.focusedErrorBorderColor ?? Colors.red,
                width: widget.focusedErrorBorderWidth ?? 1.3,
              ),
            ),
      ),
    );
  }
}
