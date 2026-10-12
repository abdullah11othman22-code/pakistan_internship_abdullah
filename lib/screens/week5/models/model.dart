//تعريف نوع الوصفة
enum RecipeCategory {
  food,
  dessert,
}







//class اضافة خطوة
class RecipeStep {
  final String title;
  final String description;

  const RecipeStep({
    required this.title,
    required this.description,
  });
}
////////////////////






//معلومات الوصفة
class Recipe {
  final int? id;
  final String name;
  final String imageUrlOrPath;
  final RecipeCategory category;
  final List<String> ingredients;
  final List<RecipeStep> steps;

  const Recipe({
    this.id,
    required this.name,
    required this.imageUrlOrPath,
    required this.category,
    required this.ingredients,
    required this.steps,
  });
}
