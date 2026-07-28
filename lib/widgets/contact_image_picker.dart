import 'dart:io';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_img_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactImagePicker extends StatelessWidget {
  final File? pickedImage;
  final VoidCallback onTap;

  const ContactImagePicker({
    super.key,
    required this.pickedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        width: 143,
        height: 146,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold),
          borderRadius: BorderRadius.circular(28),
        ),
        child: pickedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  pickedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            : Lottie.asset(AppImgPaths.imagePickerAnimation),
      ),
    );
  }
}
