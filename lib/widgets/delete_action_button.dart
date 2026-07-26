import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class DeleteActionButton extends StatelessWidget {
  final VoidCallback onDeleteLast;
  final double bottom;
  const DeleteActionButton({
    super.key,
    required this.onDeleteLast,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: bottom,
      child: FloatingActionButton(
        onPressed: onDeleteLast,
        backgroundColor: AppColors.red,
        child: Icon(Icons.delete, color: AppColors.white),
      ),
    );
  }
}
