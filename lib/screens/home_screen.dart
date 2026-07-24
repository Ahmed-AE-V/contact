import 'package:contact/models/contact.dart';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_img_paths.dart';
import 'package:contact/widgets/add_button.dart';
import 'package:contact/widgets/app_bar_title.dart';
import 'package:contact/widgets/empty_msg.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = []; // 👈 the shelf

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

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
          AddButton(onContactAdded: _addContact),
        ],
      ),
    );
  }
}
