import 'package:courierapp/core/utils/constants/app_sizes.dart';
import 'package:courierapp/core/utils/helpers/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:courierapp/core/common/styles/get_text_style.dart'; // Replace with your actual import
import 'package:courierapp/core/utils/constants/app_colors.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
    required this.hintText,
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
  });

  final String hintText;
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

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  bool _obscureText = true;
  String _selectedCountryCode = '+880';
  final List<String> countryCodes = [
    '+880',
    '+1',
    '+44',
    '+91',
    '+61',
    '+49',
    '+33',
    '+81',
    '+55',
    '+34'
  ];

  int getValidPhoneLength(String countryCode) {
    Map<String, int> countryPhoneLengths = {
      '+880': 8,
      '+1': 10,
      '+44': 10,
      '+91': 10,
      '+61': 9,
      '+49': 11,
      '+33': 9,
      '+81': 10,
      '+55': 11,
      '+34': 9,
    };
    return countryPhoneLengths[countryCode] ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      controller: widget.controller,
      // validator: (value) {
      //   return AppHelperFunctions.phoneNumberValidator(
      //       value, _selectedCountryCode);
      // },
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: TextInputType.phone,
      style: getTextStyleMsrt(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              isExpanded: false,
              padding: EdgeInsets.all(0),
              dropdownColor: AppColors.white,
              value: _selectedCountryCode,
              onChanged: (newValue) {
                setState(() {
                  _selectedCountryCode = newValue!;
                });
              },
              items: countryCodes.map((code) {
                return DropdownMenuItem(
                  value: code,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      countryCodes.indexOf(code) == 0
                          ? Transform.flip(
                              flipX: true,
                              child: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                            )
                          : SizedBox.shrink(),
                      const SizedBox(width: 4),
                      Text(
                        code,
                        style: getTextStyleMsrt(
                          fontWeight: FontWeight.w500,
                          fontSize: getWidth(16),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              icon: SizedBox.shrink(),
            ),
          ),
        ),
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
