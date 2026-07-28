import 'package:contact/models/contact.dart';
import 'package:contact/widgets/add_contact_sheet.dart';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final void Function(Contact contact) onContactAdded;
  const AddButton({super.key, required this.onContactAdded});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: FloatingActionButton(
        backgroundColor: AppColors.gold,
        onPressed: () => _openAddContactSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddContactSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      context: context,
      builder: (context) => AddContactSheet(onContactAdded: onContactAdded),
    );
  }
}
