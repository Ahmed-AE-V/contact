import 'dart:io';
import 'package:contact/utils/conestants/app_colors.dart';
import 'package:contact/widgets/bottom_sheet_button.dart';
import 'package:contact/widgets/bottom_sheet_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Future<void> _pickImage(
    void Function(void Function()) setSheetState,
    File? Function() getImage,
    void Function(File?) setImage,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setSheetState(() {
        setImage(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: FloatingActionButton(
        onPressed: () {
          File? pickedImage;

          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: AppColors.darkBlue,
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setSheetState) {
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
                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .stretch,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(28),
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  final XFile? image = await picker.pickImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 80,
                                  );
                                  if (image != null) {
                                    setSheetState(() {
                                      pickedImage = File(image.path);
                                    });
                                  }
                                },
                                child: Container(
                                  width: 143,
                                  height: 146,
                                  padding: const EdgeInsets.all(11),
                                  decoration: BoxDecoration(
                                    border: BoxBorder.all(
                                      color: AppColors.gold,
                                    ),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: pickedImage != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: Image.file(
                                            pickedImage!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        )
                                      : Lottie.asset(
                                          'assets/animations/image_picker.json',
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 9,
                            children: [
                              BottomSheetTextField(hintMsg: "Enter user name"),
                              BottomSheetTextField(hintMsg: "Enter user email"),
                              BottomSheetTextField(hintMsg: "Enter user phone"),
                            ],
                          ),
                          BottomSheetButton(),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: AppColors.gold,
        isExtended: false,
        child: const Icon(Icons.add),
      ),
    );
  }
}
