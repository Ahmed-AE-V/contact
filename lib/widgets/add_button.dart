import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.gold,
        isExtended: false,
        child: Icon(Icons.add),
      ),
    );
  }
}
