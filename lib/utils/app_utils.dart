import 'package:flutter/material.dart';

class AppColors {
  static const primaryBlue = Color(0xFF08A6E4);
  static const cancelRed = Color(0xFFFA3B37);
  static const border = Color(0xFFBCC6D0);
  static const placeholder = Color(0xFF9AA7B8);
  static const subtitle = Color(0xFF888A8C);
  static const linkOrange = Color(0xFFEB5C26);
}

InputDecoration buildFieldDecoration(String label, {Widget? prefix}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(
      color: AppColors.placeholder,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    filled: true,
    fillColor: Colors.white,
    prefixIconConstraints:
        const BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 52),
    prefixIcon: prefix == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: prefix,
          ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.6),
    ),
  );
}

InputDecoration loginFieldDecoration({
  required String hint,
  Widget? prefix,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
      color: AppColors.placeholder,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    prefixIcon: prefix == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: prefix,
          ),
    suffixIcon: suffix == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(right: 8),
            child: suffix,
          ),
    prefixIconConstraints:
        const BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 52),
    suffixIconConstraints:
        const BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 52),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:
          const BorderSide(color: AppColors.primaryBlue, width: 1.4),
    ),
  );
}
