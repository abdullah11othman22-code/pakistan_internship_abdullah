import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/shared/widgets/custom_button.dart';

import '../../../../shared/widgets/Wedgets/text_form_feild.dart';


class addItemDialog extends StatefulWidget {
  const addItemDialog({super.key});

  @override
  State<addItemDialog> createState() => _addItemDialogState();
}

class _addItemDialogState extends State<addItemDialog> {
  final titleController = TextEditingController();

  final subtitleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  File? file;

  void pickImage() async {
    final XFile? imageGallery = await picker.pickImage(
      source: ImageSource.gallery,

    );
    file = File(imageGallery as String).path as File?;
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Dialog(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFeild(
                  controller: titleController,
                  title: 'Enter Title',
                  hint: 'SoftWare Department',
                ),
                SizedBox(height: 24),
                CustomTextFeild(
                  hint: 'Hi I am jounior Developer ',
                  controller: subtitleController,
                  title: 'subtitle',
                ),
                SizedBox(height: 24),

                GestureDetector(
                  onTap: (){pickImage();},
                  child: CircleAvatar(
                    backgroundColor: Colors.white60,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.deepPurple,
                      size: 28,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                CustomButton(buttonType: ButtonType.small, text: 'add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

