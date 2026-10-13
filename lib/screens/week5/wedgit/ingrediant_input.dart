
import 'package:flutter/material.dart';

class IngredientInput extends StatelessWidget {
  const IngredientInput({
    super.key,
    required this.controller,
    required this.onRemove,
    required this.canRemove,
  });

  final TextEditingController controller;
  final VoidCallback onRemove;
  final bool canRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'المكوّن',
              hintText: 'مثلاً: كوب طحين',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'يرجى إدخال المكوّن';
              }
              return null;
            },
          ),
        ),
        if (canRemove)
          IconButton(
            onPressed: onRemove,
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
