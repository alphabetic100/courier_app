import 'package:courierapp/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTexFormField extends StatefulWidget {
  const CustomTexFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.maxLines = 1,
    this.radius,
    this.prefixIcon,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int maxLines;
  final double? radius;
  final Widget? prefixIcon;

  @override
  State<CustomTexFormField> createState() => _CustomTexFormFieldState();
}

class _CustomTexFormFieldState extends State<CustomTexFormField> {
  bool _obscureText = true; // Default to obscure the text

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword
          ? _obscureText
          : false, // Obscure for password fields

      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: AppColors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xff9CA3AF),
          fontSize: 14,
        ),
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
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle visibility
                  });
                },
              )
            : null, // No suffix icon for non-password fields
      ),
    );
  }
}
