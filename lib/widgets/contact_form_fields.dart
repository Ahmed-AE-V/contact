import 'package:contact/utils/conestants/app_strings.dart';
import 'package:contact/widgets/bottom_sheet_text_field.dart';
import 'package:flutter/material.dart';

class ContactFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final ValueChanged<String> onAnyChanged;

  const ContactFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onAnyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 9,
      children: [
        BottomSheetTextField(
          hintMsg: AppStrings.nameHint,
          controller: nameController,
          onChanged: onAnyChanged,
        ),
        BottomSheetTextField(
          hintMsg: AppStrings.emailHint,
          controller: emailController,
          onChanged: onAnyChanged,
        ),
        BottomSheetTextField(
          hintMsg: AppStrings.phoneHint,
          controller: phoneController,
          onChanged: onAnyChanged,
        ),
      ],
    );
  }
}
