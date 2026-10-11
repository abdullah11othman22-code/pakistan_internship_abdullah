import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    required this.controller,
    required this.title,
    this.validator,
  });

  final String hint;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.deepPurple, fontSize: 16)),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "please fill the field";
                }
              },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}
