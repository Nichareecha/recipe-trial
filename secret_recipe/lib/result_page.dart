import 'package:flutter/material.dart';
import 'RecipeDetailsPage.dart';

class ResultPage extends StatelessWidget {
  final List<String> cuisine;
  final List<String> dietaryRestrictions;

  ResultPage(this.cuisine, this.dietaryRestrictions);

  // Example: Hardcoded recipes based on user input
  List<String> getRecipes() {
    List<String> recipes = [];

    // Add recipes based on selected cuisines
    if (cuisine.contains('Italian')) {
      recipes.addAll(['Spaghetti Bolognese', 'Margherita Pizza', 'Maccaroni']);
    }
    if (cuisine.contains('Mexican')) {
      recipes.addAll(['Tacos', 'Guacamole']);
    }
    if (cuisine.contains('Thai')) {
      recipes.addAll(['PadThai', 'Thai Green Curry']);
    }

    // Filter recipes based on dietary restrictions
    if (dietaryRestrictions.contains('Vegetarian')) {
      recipes =
          recipes.where((recipe) => !recipe.contains('Bolognese')).toList();
    }
    if (dietaryRestrictions.contains('Gluten-Free')) {
      recipes = recipes.where((recipe) => !recipe.contains('Pizza')).toList();
    }
    if (dietaryRestrictions.contains('Halal')) {
      recipes = recipes
          .where((recipe) =>
              !(recipe.contains('Pizza') && recipe.contains('Bolognese')))
          .toList();
    }

    return recipes;
  }

  Map<String, String> recipeDetails = {
    'Spaghetti Bolognese': 'Just spaghetti',
    'Margherita Pizza': 'YAY',
    'Maccaroni': 'I am Italian!!',
    'Tacos': "Hated it",
    'Guacamole': 'WTH is this',
    'PadThai': 'Spicy',
    'Thai Green Curry': 'good good!!',
    // Add details for other recipes
  };

  @override
  Widget build(BuildContext context) {
    List<String> recipes = getRecipes();

    if (recipes.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Founded recipes',
              style: TextStyle(
                color: const Color.fromARGB(255, 50, 71, 82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1162787549/vector/cooking-vector-seamless-pattern-hand-drawn-doodle-food-and-kitchen-utensils.jpg?s=612x612&w=0&k=20&c=FCu3qPDBHosBcm1imtzOFXFmNzoYXyyV4DQCSKbYw7Q='), // Replace with your image URL
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(
                      0.5), // Adjust opacity as needed (0.0 to 1.0)
                  BlendMode.dstATop,
                ),
                alignment: FractionalOffset(0.5, 0.1), // Move down by 10%
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No recipes match your selected criteria.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Founded recipes',
            style: TextStyle(
              color: const Color.fromARGB(255, 50, 71, 82),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/id/1162787549/vector/cooking-vector-seamless-pattern-hand-drawn-doodle-food-and-kitchen-utensils.jpg?s=612x612&w=0&k=20&c=FCu3qPDBHosBcm1imtzOFXFmNzoYXyyV4DQCSKbYw7Q='), // Replace with your image URL
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black
                    .withOpacity(0.5), // Adjust opacity as needed (0.0 to 1.0)
                BlendMode.dstATop,
              ),
              alignment: FractionalOffset(0.5, 0.1), // Move down by 10%
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recipes based on your specifications:'),
            SizedBox(height: 10),
            // Display elevated buttons for each recipe
            for (String recipe in recipes)
              ElevatedButton(
                onPressed: () {
                  // Navigate to a new page to show details of the selected recipe
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailsPage(
                          recipe,
                          recipeDetails[recipe] ??
                              'No details available'), // Pass the selected recipe and details here
                    ),
                  );
                },
                child: Text(recipe),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                  padding: EdgeInsets.all(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
