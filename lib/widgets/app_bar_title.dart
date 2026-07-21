import 'package:contact/utils/conestants/app_img_paths.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImgPaths.appBarImg,
          height: 39,
          width: 117,
          alignment: AlignmentGeometry.centerLeft,
        ),
      ],
    );
  }
}
