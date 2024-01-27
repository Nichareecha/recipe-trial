// input_page.dart
import 'History.dart';
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
  bool thaiselected = false;
  bool vegetarianSelected = false;
  bool glutenFreeSelected = false;
  bool HalalSelected = false;
  String? selectedCalories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Unfold the recipe!',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select Cuisine:'),
            ToggleButtons(
              children: [
                Text('Italian'),
                Text('Mexican'),
                Text('Thai'),
              ],
              isSelected: [italianSelected, mexicanSelected, thaiselected],
              onPressed: (index) {
                setState(() {
                  if (index == 0) italianSelected = !italianSelected;
                  if (index == 1) mexicanSelected = !mexicanSelected;
                  if (index == 2) thaiselected = !thaiselected;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Calories:'),
            RadioListTile<String>(
              title: Text('Low'),
              value: 'Low',
              groupValue: selectedCalories,
              onChanged: (value) {
                setState(() {
                  selectedCalories = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Medium'),
              value: 'Medium',
              groupValue: selectedCalories,
              onChanged: (value) {
                setState(() {
                  selectedCalories = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('High'),
              value: 'High',
              groupValue: selectedCalories,
              onChanged: (value) {
                setState(() {
                  selectedCalories = value;
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
                    builder: (context) => ResultPage(selectedCuisines,
                        selectedRestrictions, selectedCalories),
                  ),
                );
              },
              child: Text('Get Recipes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(),
                  ),
                );
              },
              child: Text('View History'),
            ),
          ],
        ),
      ),
    );
  }
}
