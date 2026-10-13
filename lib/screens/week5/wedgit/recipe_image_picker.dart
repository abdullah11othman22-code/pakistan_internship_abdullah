import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecipeImagePicker extends StatefulWidget {
  const RecipeImagePicker({super.key, required this.onImageSelected});

  final ValueChanged<File?> onImageSelected;

  @override
  State<RecipeImagePicker> createState() => _RecipeImagePickerState();
}

class _RecipeImagePickerState extends State<RecipeImagePicker> {
  final ImagePicker _picker = ImagePicker();

  File? selectedImage;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;

    final file = File(image.path);

    setState(() {
      selectedImage = file;
    });

    widget.onImageSelected(file);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: pickImage,
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: const Text('إضافة صورة'),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: 75,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.06),
              border: Border.all(color: Colors.deepPurple.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: selectedImage == null
                ? const Icon(
                    Icons.image_outlined,
                    size: 30,
                    color: Colors.deepPurple,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                      width: 75,
                      height: 65,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
