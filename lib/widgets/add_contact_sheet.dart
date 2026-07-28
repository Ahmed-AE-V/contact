import 'dart:io';
import 'package:contact/models/contact.dart';
import 'package:contact/widgets/contact_form_fields.dart';
import 'package:contact/widgets/contact_image_picker.dart';
import 'package:contact/widgets/contact_preview.dart';
import 'package:contact/widgets/bottom_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactSheet extends StatefulWidget {
  final void Function(Contact contact) onContactAdded;
  const AddContactSheet({super.key, required this.onContactAdded});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _pickedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      setState(() => _pickedImage = File(image.path));
    }
  }

  void _saveContact() {
    final contact = Contact(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      image: _pickedImage,
    );

    widget.onContactAdded(contact);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 30,
        bottom: 30 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ContactImagePicker(
                  pickedImage: _pickedImage,
                  onTap: _pickImage,
                ),
                const SizedBox(width: 16),
                ContactPreview(
                  nameController: _nameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                ),
              ],
            ),
            ContactFormFields(
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
              onAnyChanged: (_) => setState(() {}),
            ),
            BottomSheetButton(onPressed: _saveContact),
          ],
        ),
      ),
    );
  }
}
