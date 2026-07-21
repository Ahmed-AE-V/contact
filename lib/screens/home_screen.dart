import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_img_paths.dart';
import 'package:contact/widgets/add_button.dart';
import 'package:contact/widgets/app_bar_title.dart';
import 'package:contact/widgets/empty_msg.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(backgroundColor: AppColors.darkBlue, title: AppBarTitle()),
      body: Stack(
        children: [
          ListView(
            children: [
              Lottie.asset(AppImgPaths.emptyListAnimation),
              EmptyMsg(),
            ],
          ),
          AddButton(),
        ],
      ),
    );
  }
}
