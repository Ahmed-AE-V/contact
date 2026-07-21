import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_strings.dart';
import 'package:flutter/material.dart';

class EmptyMsg extends StatelessWidget {
  const EmptyMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          AppStrings.emptymMsg,
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 20,
            fontWeight: .w500,
          ),
        ),
      ],
    );
  }
}
