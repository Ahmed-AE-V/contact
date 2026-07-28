import 'package:contact/models/contact.dart';
import 'package:contact/widgets/contact_card_firstblock.dart';
import 'package:contact/widgets/contact_card_second_block.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactCardFirstblock(contact: contact),

          ContactCardSecondBlock(contact: contact, onDelete: onDelete),
        ],
      ),
    );
  }
}
