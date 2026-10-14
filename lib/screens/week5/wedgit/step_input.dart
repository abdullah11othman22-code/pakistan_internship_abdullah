
import 'package:flutter/material.dart';

class StepInput extends StatelessWidget {
  const StepInput({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onRemove,
    required this.canRemove,
    required this.onChanged,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onRemove;
  final bool canRemove;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: titleController,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: 'Step Name',
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepPurple.withOpacity(0.8),
              ),
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
              return 'please input step name ';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: descriptionController,
          onChanged: onChanged,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Description Step',
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepPurple.withOpacity(0.8),
              ),
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
              return 'please input description step';
            }
            return null;
          },
        ),
        if (canRemove)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onRemove,
              icon: const Icon(Icons.remove_circle_outline),
              label: const Text('حذف الخطوة'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
