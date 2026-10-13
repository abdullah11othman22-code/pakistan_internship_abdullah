
import 'package:flutter/material.dart';
import 'ingrediant_input.dart';

class IngredientSection extends StatefulWidget {
  const IngredientSection({super.key, required this.onIngredientsChanged});

  final ValueChanged<List<String>> onIngredientsChanged;
  @override
  State<IngredientSection> createState() =>
      _IngredientSectionState();
}

class _IngredientSectionState extends State<IngredientSection> {
  final List<TextEditingController> ingredientControllers = [
    TextEditingController(),
  ];
  void notifyIngredientsChanged() {
    widget.onIngredientsChanged(
      ingredientControllers
          .map((controller) => controller.text.trim())
          .toList(),
    );
  }
  void addIngredient() {
    setState(() {
      ingredientControllers.add(TextEditingController());
    });
    notifyIngredientsChanged();
  }

  void removeIngredient(int index) {
    if (ingredientControllers.length <= 1) return;

    final controller = ingredientControllers.removeAt(index);

    setState(() {});

    controller.dispose();
    notifyIngredientsChanged();
  }

  @override
  void dispose() {
    for (final controller in ingredientControllers) {
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
            itemCount: ingredientControllers.length,
            separatorBuilder: (context, index) =>
            const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return IngredientInput(
                key: ValueKey(ingredientControllers[index]),
                controller: ingredientControllers[index],
                onRemove: () => removeIngredient(index),
                canRemove: ingredientControllers.length > 1,
                onChanged: (_) => notifyIngredientsChanged(),
              );
            },
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: addIngredient,
              icon: const Icon(Icons.add),
              label: const Text('إضافة مكوّن'),
            ),
          ),
        ],
      ),
    );
  }
}
