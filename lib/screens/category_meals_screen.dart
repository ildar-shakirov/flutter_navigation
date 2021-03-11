import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/widgets/meal_item.dart';
import '../mock_data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = meals.where((element) {
      return element.categories.contains(routesArgs['id']);
    }).toList();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(routesArgs['title']),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability);
            },
            itemCount: categoryMeals.length,
          ),
        ),
      ),
    );
  }
}
