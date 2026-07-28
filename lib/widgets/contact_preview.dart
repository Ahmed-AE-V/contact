import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_strings.dart';
import 'package:flutter/material.dart';

class ContactPreview extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ContactPreview({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _previewLine(nameController.text, AppStrings.namePlaceholder),
          const SizedBox(height: 30, child: Divider(color: AppColors.gold)),
          _previewLine(emailController.text, AppStrings.emailPlaceholder),
          const SizedBox(height: 30, child: Divider(color: AppColors.gold)),
          _previewLine(phoneController.text, AppStrings.phonePlaceholder),
        ],
      ),
    );
  }

  Widget _previewLine(String value, String placeholder) {
    return Text(
      value.isEmpty ? placeholder : value,
      style: const TextStyle(
        color: AppColors.gold,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
