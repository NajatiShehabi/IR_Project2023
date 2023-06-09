import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ir_project/app/core/utils/extentions.dart';

import '../utils/failures/field_failure/field_failure.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.title,
    this.initValue,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.autoValidate = true,
    this.onChange,
    this.onTap,
    this.textInputAction,
    this.fillColor,
    this.textInputType,
    this.suffixText,
    this.readOnly = false,
    this.hintStyle,
    this.maxLines = 1,
    this.inputFormatters,
  }) : super(key: key);

  final bool autoValidate;
  final TextInputType? textInputType;
  final int maxLines;
  final String? initValue;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? title;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final FieldFailure? Function(String)? validator;
  final bool isPassword;
  final Function()? onTap;
  final bool readOnly;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? Container()
            : Column(
                children: [
                  Text(widget.title!, style: Get.textTheme.labelMedium),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
        TextFormField(
          initialValue: widget.initValue,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          validator: widget.validator != null
              ? (value) {
                  return context
                      .fieldFailureParser(widget.validator!(value ?? ''));
                }
              : null,
          readOnly: widget.readOnly,
          onChanged: widget.onChange,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          autovalidateMode: widget.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          obscureText: widget.isPassword,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            hintStyle: widget.hintStyle,
            suffixText: widget.suffixText,
            suffixIcon: widget.suffix,
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ],
    );
  }
/*
  Widget? getSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (widget.isPassword) {
      return IconButton(
        icon: widget.showPassword
            ? CustomSvgIcon(Assets.icons.lockIcon)
            : CustomSvgIcon(Assets.icons.lockIcon),
        onPressed: () {
          {
            setState(() {
              widget.showPassword = (!showPassword);
            });
          }
        },
      );
    }
    return null;
  }*/
}
