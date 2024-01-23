// input_page.dart
import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State variables to store user selections
  bool italianSelected = false;
  bool mexicanSelected = false;
  bool vegetarianSelected = false;
  bool glutenFreeSelected = false;
  bool HalalSelected = false;
  bool thaiselected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App - Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select Cuisine:'),
            CheckboxListTile(
              title: Text('Italian'),
              value: italianSelected,
              onChanged: (value) {
                setState(() {
                  italianSelected = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Mexican'),
              value: mexicanSelected,
              onChanged: (value) {
                setState(() {
                  mexicanSelected = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Thai'),
              value: thaiselected,
              onChanged: (value) {
                setState(() {
                  thaiselected = value!;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Select Dietary Restrictions:'),
            CheckboxListTile(
              title: Text('Vegetarian'),
              value: vegetarianSelected,
              onChanged: (value) {
                setState(() {
                  vegetarianSelected = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Gluten-Free'),
              value: glutenFreeSelected,
              onChanged: (value) {
                setState(() {
                  glutenFreeSelected = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Halal'),
              value: HalalSelected,
              onChanged: (value) {
                setState(() {
                  HalalSelected = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Extract selected options and pass them to the result page
                List<String> selectedCuisines = [];
                if (italianSelected) selectedCuisines.add('Italian');
                if (mexicanSelected) selectedCuisines.add('Mexican');
                if (thaiselected) selectedCuisines.add('Thai');

                List<String> selectedRestrictions = [];
                if (vegetarianSelected) selectedRestrictions.add('Vegetarian');
                if (glutenFreeSelected) selectedRestrictions.add('Gluten-Free');
                if (HalalSelected) selectedRestrictions.add('Halal');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(selectedCuisines, selectedRestrictions),
                  ),
                );
              },
              child: Text('Get Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}
