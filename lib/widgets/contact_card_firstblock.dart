import 'package:contact/models/contact.dart';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:flutter/material.dart';

class ContactCardFirstblock extends StatelessWidget {
  final Contact contact;
  const ContactCardFirstblock({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        contact.image != null
            ? Image.file(
                contact.image!,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              )
            : Container(
                width: double.infinity,
                height: 160,
                color: AppColors.black,
                child: Icon(Icons.person, color: AppColors.gold, size: 40),
              ),
        Positioned(
          left: 8,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              contact.name,
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
