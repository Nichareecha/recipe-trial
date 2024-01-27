import 'calories.dart';
import 'cuisine.dart';
import 'pictures.dart';
import 'package:flutter/material.dart';
import 'RecipeDetailsPage.dart';
import 'details.dart';

class ResultPage extends StatelessWidget {
  final List<String> cuisine;
  final List<String> dietaryRestrictions;
  final String? caloriesRestriction;

  ResultPage(this.cuisine, this.dietaryRestrictions, this.caloriesRestriction);

  List<String> getRecipes() {
    List<String> recipes = [];

    // Add recipes based on selected cuisines
    if (cuisine.contains('Italian')) {
      recipes.addAll(nationcuisine['Italian'] as Iterable<String>);
    }
    if (cuisine.contains('Mexican')) {
      recipes.addAll(nationcuisine['Mexican'] as Iterable<String>);
    }
    if (cuisine.contains('Thai')) {
      recipes.addAll(nationcuisine['Thai'] as Iterable<String>);
    }

    // Filter recipes based on dietary restrictions
    if (dietaryRestrictions.contains('Vegetarian')) {
      recipes = recipes
          .where((recipe) => !resrictions['Vegetarian']!
              .any((ingredient) => recipe.contains(ingredient)))
          .toList();
    }
    if (dietaryRestrictions.contains('Gluten-Free')) {
      recipes = recipes
          .where((recipe) => !resrictions['Gluten-Free']!
              .any((ingredient) => recipe.contains(ingredient)))
          .toList();
    }
    if (dietaryRestrictions.contains('Halal')) {
      recipes = recipes
          .where((recipe) => !resrictions['Halal']!
              .any((ingredient) => recipe.contains(ingredient)))
          .toList();
    }

    //filter unwanted calories range
    if (caloriesRestriction == 'low') {
      recipes =
          recipes.where((recipe) => !recipe.contains('Bolognese')).toList();
    }
    if (caloriesRestriction == 'medium') {
      recipes = recipes.where((recipe) => !recipe.contains('Pizza')).toList();
    }
    if (caloriesRestriction == 'high') {
      recipes = recipes
          .where((recipe) =>
              !(recipe.contains('Pizza') && recipe.contains('Bolognese')))
          .toList();
    }

    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    List<String> recipes = getRecipes();
    // int totalcalories = getCalories();

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
                  Colors.black.withOpacity(
                      0.5), // Adjust opacity as needed (0.0 to 1.0)
                  BlendMode.dstATop,
                ),
                alignment: FractionalOffset(0.5, 0.1), // Move down by 10%
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recipes based on your specifications:'),
              SizedBox(height: 10),
              // Display containers with elevated buttons and additional text for each recipe
              for (String recipe in recipes)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$recipe', // Recipe name on the left
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                                height:
                                    5), // Add some spacing between the main recipe name and subtext
                            Text(
                              recipesubtexts[recipe] ??
                                  '', // Add your subtext here
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Image.network(
                        recipePictures[recipe] ??
                            '', // Provide a placeholder image URL
                        width: 50, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to a new page to show details of the selected recipe
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailsPage(
                                recipe,
                                recipeDetails[recipe] ?? 'No details available',
                                recipeCalories[recipe] ?? 0,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('More details'),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}
