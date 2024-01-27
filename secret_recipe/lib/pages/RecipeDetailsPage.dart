import 'package:secret_recipe/main.dart';
import 'pictures.dart';
import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final String recipe;
  final String details;
  final int calories;

  RecipeDetailsPage(this.recipe, this.details, this.calories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'How to cook?',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details for $recipe',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Image.network(
              recipePictures[recipe] ?? '',
              width: 200,
              height: 200,
            ),
            Text(
              'Calories: $calories',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Cooking Details:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              details,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                confirmRecipeSelection(context, recipe);
              },
              child: Text('Import to history'),
            )
          ],
        ),
      ),
    );
  }

  void confirmRecipeSelection(BuildContext context, String selectedRecipe) {
    AppData.history.add(selectedRecipe);
    AppData.dateAdded[recipe] = DateTime.now().day;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$recipe imported'),
      ),
    );
  }
}
