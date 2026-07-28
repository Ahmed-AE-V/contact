import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetTextField extends StatelessWidget {
  final String hintMsg;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  const BottomSheetTextField({
    super.key,
    required this.hintMsg,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.lightBlue,
      style: TextStyle(color: AppColors.gold, fontSize: 16, fontWeight: .w400),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
        hintText: hintMsg,
        hintStyle: TextStyle(
          color: AppColors.lightBlue,
          fontSize: 16,
          fontWeight: .w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold),
        ),
      ),
    );
  }
}
