import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final VoidCallback onPressed;
  const BottomSheetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBlue,
        fixedSize: Size(.infinity, 60),
      ),
      child: Text(
        "Enter User",
        style: TextStyle(fontSize: 20, fontWeight: .w400),
      ),
    );
  }
}
