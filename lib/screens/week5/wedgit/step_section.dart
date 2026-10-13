
import 'package:flutter/material.dart';
import '../models/model.dart';
import 'step_input.dart';

class StepSection extends StatefulWidget {
const StepSection({super.key, required this.onStepsChanged});

final ValueChanged<List<RecipeStep>> onStepsChanged;
@override
State<StepSection> createState() => _StepSectionState();
}

class _StepSectionState extends State<StepSection> {
  void notifyStepsChanged() {
    widget.onStepsChanged(
      List.generate(
        titleControllers.length,
            (index) => RecipeStep(
          title: titleControllers[index].text.trim(),
          description: descriptionControllers[index].text.trim(),
        ),
      ),
    );
  }
final List<TextEditingController> titleControllers = [
TextEditingController(),
];

final List<TextEditingController> descriptionControllers = [
TextEditingController(),
];

void addStep() {
setState(() {
titleControllers.add(TextEditingController());
descriptionControllers.add(TextEditingController());
});
}

void removeStep(int index) {
if (titleControllers.length <= 1) return;

final titleController = titleControllers[index];
final descriptionController = descriptionControllers[index];

setState(() {
titleControllers.removeAt(index);
descriptionControllers.removeAt(index);
});

titleController.dispose();
descriptionController.dispose();
}

@override
void dispose() {
for (final controller in titleControllers) {
controller.dispose();
}

for (final controller in descriptionControllers) {
controller.dispose();
}

super.dispose();
}

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
border: Border.all(
color: Colors.deepPurple.withOpacity(0.5),
),
borderRadius: BorderRadius.circular(12),
),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
ListView.separated(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemCount: titleControllers.length,
separatorBuilder: (context, index) =>
const Divider(height: 24),
itemBuilder: (context, index) {
return StepInput(
key: ValueKey(titleControllers[index]),
titleController: titleControllers[index],
descriptionController: descriptionControllers[index],
onRemove: () => removeStep(index),
canRemove: titleControllers.length > 1,
);
},
),
const SizedBox(height: 12),
Align(
alignment: Alignment.centerRight,
child: ElevatedButton.icon(
onPressed: addStep,
icon: const Icon(Icons.add),
label: const Text('إضافة خطوة'),
),
),
],
),
);
}
}
