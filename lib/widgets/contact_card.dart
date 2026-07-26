import 'package:contact/models/contact.dart';
import 'package:contact/utils/conestants/app_colors.dart';
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
          Stack(
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
                      child: Icon(
                        Icons.person,
                        color: AppColors.gold,
                        size: 40,
                      ),
                    ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
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
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.gold,
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: .spaceBetween,
              // spacing: ,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: AppColors.darkBlue,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        contact.email,
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: AppColors.darkBlue,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        contact.phone,
                        style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: onDelete,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    icon: Icon(Icons.delete, size: 18),
                    label: Text("Delete"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
