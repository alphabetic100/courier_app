import 'package:courierapp/core/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:courierapp/core/common/styles/get_text_style.dart';
import 'package:courierapp/core/utils/constants/app_colors.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.radius = 4.0,
    this.onChange,
    this.onTap,
    this.readOnly = false,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double radius;
  final Function(String)? onChange;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  String _selectedCountryCode = '+34';

  static const Map<String, int> countryPhoneLengths = {
    '+880': 10,
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onChanged: widget.onChange,
      onTap: widget.onTap,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.phone,
      style: getTextStyleMsrt(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              isExpanded: false,
              padding: const EdgeInsets.all(0),
              dropdownColor: AppColors.white,
              value: _selectedCountryCode,
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() => _selectedCountryCode = newValue);
                }
              },
              items: countryPhoneLengths.keys.map((code) {
                return DropdownMenuItem(
                  value: code,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.flip(
                        flipX: true,
                        child: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 4),
                      CustomText(
                        text: code,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              }).toList(),
              icon: const SizedBox.shrink(),
            ),
          ),
        ),
        filled: true,
        fillColor: AppColors.white,
        labelStyle: getTextStyleMsrt(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        hintText: widget.hintText,
        hintStyle:
            getTextStyleMsrt(color: const Color(0xFF84828E), fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: const BorderSide(color: Color(0xFFE2E2E6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: const BorderSide(color: Color(0xFFE2E2E6), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
}
