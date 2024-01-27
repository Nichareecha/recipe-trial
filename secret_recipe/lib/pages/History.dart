import 'package:secret_recipe/main.dart';
import 'RecipeDetailsPage.dart';
import 'calories.dart';
import 'details.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<String> historyRecipes = AppData.history;

    Map<int, double> dailyTotalCalories = {};

    for (String recipe in historyRecipes) {
      int recipeDay = AppData.dateAdded[recipe] ?? DateTime.now().day;
      double calories = (recipeCalories[recipe] ?? 0).toDouble();

      if (dailyTotalCalories.containsKey(recipeDay)) {
        dailyTotalCalories[recipeDay] =
            (dailyTotalCalories[recipeDay] ?? 0) + calories;
      } else {
        dailyTotalCalories[recipeDay] = calories;
      }
    }

    List<ChartData> chartData = [];

    for (int i = 6; i >= 0; i--) {
      DateTime day = DateTime.now().subtract(Duration(days: i));
      double totalCalories = dailyTotalCalories[day.day] ?? 0;
      chartData.add(ChartData('${day.day}/${day.month}', totalCalories));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Previous Dishes',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Recipe History:'),
          SizedBox(height: 10),
          Container(
            height: 300,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                title: AxisTitle(text: 'Day/Month'),
              ),
              primaryYAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                title: AxisTitle(text: 'Total Calories'),
              ),
              series: <ChartSeries>[
                LineSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.dayAndMonth,
                  yValueMapper: (ChartData data, _) => data.totalCalories,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          for (String recipe in historyRecipes)
            Dismissible(
              key: Key(recipe),
              onDismissed: (direction) {
                deleteRecipe(recipe);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '$recipe',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        deleteRecipe(recipe);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    ElevatedButton(
                      onPressed: () {
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
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void deleteRecipe(String recipe) {
    AppData.history.remove(recipe);
    AppData.dateAdded.remove(recipe);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$recipe deleted'),
      ),
    );
  }
}

class ChartData {
  final String dayAndMonth;
  final double totalCalories;

  ChartData(this.dayAndMonth, this.totalCalories);
}
