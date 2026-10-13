
import 'package:flutter/material.dart';

class StepInput extends StatelessWidget {
const StepInput({
super.key,
required this.titleController,
required this.descriptionController,
required this.onRemove,
required this.canRemove,
});

final TextEditingController titleController;
final TextEditingController descriptionController;
final VoidCallback onRemove;
final bool canRemove;

@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
TextFormField(
controller: titleController,
decoration: const InputDecoration(
labelText: 'عنوان الخطوة',
hintText: 'مثلاً: تجهيز المكونات',
border: OutlineInputBorder(),
),
validator: (value) {
if (value == null || value.trim().isEmpty) {
return 'يرجى إدخال عنوان الخطوة';
}
return null;
},
),
const SizedBox(height: 12),
TextFormField(
controller: descriptionController,
maxLines: 3,
decoration: const InputDecoration(
labelText: 'وصف الخطوة',
hintText: 'اشرح ماذا يجب أن نفعل في هذه الخطوة',
border: OutlineInputBorder(),
alignLabelWithHint: true,
),
validator: (value) {
if (value == null || value.trim().isEmpty) {
return 'يرجى إدخال وصف الخطوة';
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
