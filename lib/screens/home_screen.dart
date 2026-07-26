import 'package:contact/models/contact.dart';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/utils/conestants/app_img_paths.dart';
import 'package:contact/widgets/add_button.dart';
import 'package:contact/widgets/app_bar_title.dart';
import 'package:contact/widgets/contact_card.dart';
import 'package:contact/widgets/delete_action_button.dart';
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
  final List<Contact> contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  void _deleteLastContact() {
    setState(() {
      contacts.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(backgroundColor: AppColors.darkBlue, title: AppBarTitle()),
      body: Stack(
        children: [
          if (contacts.isEmpty)
            ListView(
              children: [
                Lottie.asset(AppImgPaths.emptyListAnimation),
                EmptyMsg(),
              ],
            )
          else
            GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                childAspectRatio: .65,
              ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(
                  contact: contacts[index],
                  onDelete: () {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  },
                );
              },
            ),
          if (contacts.length < 6) AddButton(onContactAdded: _addContact),
          if (contacts.isNotEmpty)
            DeleteActionButton(
              onDeleteLast: _deleteLastContact,
              bottom: contacts.length == 6 ? 20 : 90,
            ),
        ],
      ),
    );
  }
}
