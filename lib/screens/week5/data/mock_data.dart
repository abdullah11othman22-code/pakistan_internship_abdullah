
import '../models/model.dart';


const List<Recipe> mockRecipes = [
  Recipe(
    id: 1,
    name: 'Chicken Pasta',
    imageUrlOrPath: 'https://picsum.photos/seed/chickenpasta/150/250',
    category: RecipeCategory.food,
    ingredients: [
      '250 g pasta',
      '200 g chicken breast',
      '150 ml cooking cream',
      '2 cloves garlic',
      '2 tbsp olive oil',
      'Salt and black pepper',
    ],
    steps: [
      RecipeStep(
        title: 'Boil the pasta',
        description:
        'Cook the pasta in salted boiling water until tender, then drain it.',
      ),
      RecipeStep(
        title: 'Prepare the chicken',
        description:
        'Cut the chicken into small pieces and season with salt and pepper.',
      ),
      RecipeStep(
        title: 'Cook the chicken',
        description:
        'Heat olive oil in a pan, add garlic and chicken, then cook thoroughly.',
      ),
      RecipeStep(
        title: 'Add the cream',
        description:
        'Pour in the cooking cream and simmer for a few minutes.',
      ),
      RecipeStep(
        title: 'Combine and serve',
        description:
        'Mix the pasta with the sauce and serve while hot.',
      ),
    ],
  ),

  Recipe(
    id: 2,
    name: 'Classic Beef Burger',
    imageUrlOrPath: 'https://picsum.photos/seed/beefburger/600/400',
    category: RecipeCategory.food,
    ingredients: [
      '2 burger buns',
      '300 g ground beef',
      '2 slices cheddar cheese',
      '2 lettuce leaves',
      '1 tomato',
      '2 tbsp burger sauce',
    ],
    steps: [
      RecipeStep(
        title: 'Shape the patties',
        description:
        'Divide the ground beef into two patties and season them.',
      ),
      RecipeStep(
        title: 'Cook the beef',
        description:
        'Cook the patties in a hot pan until fully cooked.',
      ),
      RecipeStep(
        title: 'Add the cheese',
        description:
        'Place cheddar cheese on the patties during the final minute.',
      ),
      RecipeStep(
        title: 'Prepare the buns',
        description:
        'Toast the buns lightly and spread the burger sauce.',
      ),
      RecipeStep(
        title: 'Assemble the burger',
        description:
        'Add lettuce, tomato and beef patties, then close the buns.',
      ),
    ],
  ),

  Recipe(
    id: 3,
    name: 'Fresh Greek Salad',
    imageUrlOrPath: 'https://picsum.photos/seed/greeksalad/600/400',
    category: RecipeCategory.food,
    ingredients: [
      '2 tomatoes',
      '1 cucumber',
      '1 green bell pepper',
      '100 g feta cheese',
      '8 black olives',
      '2 tbsp olive oil',
      '1 tbsp lemon juice',
    ],
    steps: [
      RecipeStep(
        title: 'Wash the vegetables',
        description:
        'Wash the tomatoes, cucumber and bell pepper thoroughly.',
      ),
      RecipeStep(
        title: 'Cut the vegetables',
        description:
        'Chop the vegetables into bite-sized pieces.',
      ),
      RecipeStep(
        title: 'Prepare the dressing',
        description:
        'Mix olive oil, lemon juice and a pinch of salt.',
      ),
      RecipeStep(
        title: 'Combine the salad',
        description:
        'Place the vegetables and olives in a bowl and add the dressing.',
      ),
      RecipeStep(
        title: 'Finish and serve',
        description:
        'Crumble feta cheese on top and serve fresh.',
      ),
    ],
  ),

  Recipe(
    id: 4,
    name: 'Chocolate Brownies',
    imageUrlOrPath: 'https://picsum.photos/seed/chocolatebrownies/600/400',
    category: RecipeCategory.dessert,
    ingredients: [
      '150 g dark chocolate',
      '100 g butter',
      '150 g sugar',
      '2 eggs',
      '80 g all-purpose flour',
      '2 tbsp cocoa powder',
    ],
    steps: [
      RecipeStep(
        title: 'Melt the chocolate',
        description:
        'Melt the dark chocolate and butter together, then let them cool slightly.',
      ),
      RecipeStep(
        title: 'Mix the eggs and sugar',
        description:
        'Whisk the eggs and sugar until the mixture is smooth.',
      ),
      RecipeStep(
        title: 'Combine the ingredients',
        description:
        'Stir in the melted chocolate, flour and cocoa powder.',
      ),
      RecipeStep(
        title: 'Bake the brownies',
        description:
        'Pour into a lined baking pan and bake at 180°C until set.',
      ),
      RecipeStep(
        title: 'Cool and cut',
        description:
        'Allow the brownies to cool before cutting them into squares.',
      ),
    ],
  ),

  Recipe(
    id: 5,
    name: 'Classic Pancakes',
    imageUrlOrPath: 'https://picsum.photos/seed/classicpancakes/600/400',
    category: RecipeCategory.dessert,
    ingredients: [
      '150 g all-purpose flour',
      '200 ml milk',
      '1 egg',
      '2 tbsp sugar',
      '1 tsp baking powder',
      '1 tbsp melted butter',
    ],
    steps: [
      RecipeStep(
        title: 'Mix the dry ingredients',
        description:
        'Combine flour, sugar and baking powder in a mixing bowl.',
      ),
      RecipeStep(
        title: 'Prepare the batter',
        description:
        'Add milk, egg and melted butter, then whisk until smooth.',
      ),
      RecipeStep(
        title: 'Heat the pan',
        description:
        'Lightly grease a non-stick pan and heat it over medium heat.',
      ),
      RecipeStep(
        title: 'Cook the pancakes',
        description:
        'Pour a small amount of batter into the pan and flip when bubbles appear.',
      ),
      RecipeStep(
        title: 'Serve',
        description:
        'Stack the pancakes and serve with honey or fresh fruit.',
      ),
    ],
  ),

  Recipe(
    id: 6,
    name: 'Strawberry Cheesecake',
    imageUrlOrPath: 'https://picsum.photos/seed/strawberrycheesecake/600/400',
    category: RecipeCategory.dessert,
    ingredients: [
      '200 g digestive biscuits',
      '100 g melted butter',
      '400 g cream cheese',
      '100 g sugar',
      '200 ml whipping cream',
      '200 g fresh strawberries',
    ],
    steps: [
      RecipeStep(
        title: 'Prepare the biscuit base',
        description:
        'Crush the biscuits, mix with melted butter and press into a cake tin.',
      ),
      RecipeStep(
        title: 'Make the filling',
        description:
        'Beat the cream cheese and sugar until smooth.',
      ),
      RecipeStep(
        title: 'Add the cream',
        description:
        'Whip the cream separately, then gently fold it into the cheese mixture.',
      ),
      RecipeStep(
        title: 'Assemble the cheesecake',
        description:
        'Spread the filling over the biscuit base and smooth the surface.',
      ),
      RecipeStep(
        title: 'Chill and decorate',
        description:
        'Refrigerate for at least 6 hours, then decorate with fresh strawberries.',
      ),
    ],
  ),
];
