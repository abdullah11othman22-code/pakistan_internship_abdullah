
import 'package:flutter/material.dart';

class IngredientInput extends StatelessWidget {
  const IngredientInput({
    super.key,
    required this.controller,
    required this.onRemove,
    required this.canRemove,
    required this.onChanged,
  });

  final TextEditingController controller;
  final VoidCallback onRemove;
  final bool canRemove;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: '1 cup of flour',
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple.withOpacity(0.8),
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.deepPurple.withOpacity(0.4),
                  width: 2,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'please input ingredient';
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
