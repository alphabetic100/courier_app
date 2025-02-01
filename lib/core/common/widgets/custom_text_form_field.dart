import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';

import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.maxLines = 1,
    this.radius,
    this.prefixIcon,
    this.onChange,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.isPhoneField = false, // New flag to handle phone input
  });

  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int maxLines;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool isPhoneField;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormFieldState();
}

class _CustomTexFormFieldState extends State<CustomTexFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType:
          widget.isPhoneField ? TextInputType.phone : TextInputType.text,
      style: getTextStyleMsrt(),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: AppColors.white,
        labelStyle: getTextStyleMsrt(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        hintText: widget.hintText,
        hintStyle: getTextStyleMsrt(color: Color(0xFF84828E), fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
          borderSide: BorderSide(color: Color(0xFFE2E2E6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
          borderSide: BorderSide(color: Color(0xFFE2E2E6), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Color(0xFF262B2B),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
    );
  }
}
