import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muri_client/shared/styles/colors.dart';

import '../../styles/text.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final String label;
  final Color? iconColor;

  final VoidCallback? onPrefixTap;

  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.iconColor,
    this.onPrefixTap,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextRegularLabel(label: label, color: AppColors.textColorPrimary),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          textAlign: TextAlign.right,
          readOnly: readOnly,
          onTap: onTap,

          style: GoogleFonts.alexandria(
            color: AppColors.textColorPrimary,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.alexandria(
              color: AppColors.neutral400,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            fillColor: Colors.white,

            prefixIcon: prefixIcon != null && onPrefixTap != null
                ? InkWell(
              onTap: onPrefixTap,
              borderRadius: BorderRadius.circular(12),
              child: prefixIcon,
            )
                : prefixIcon,

            prefixIconColor: iconColor ?? AppColors.neutral500,

            suffixIcon: suffixIcon,
            suffixIconColor: iconColor ?? AppColors.neutral500,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary500),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}