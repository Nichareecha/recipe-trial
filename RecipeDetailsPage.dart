import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final String recipe;
  final String details;

  RecipeDetailsPage(this.recipe, this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details for $recipe',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              details,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
