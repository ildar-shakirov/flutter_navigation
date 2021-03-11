import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: favoriteMeals.length > 0
              ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(
                        id: favoriteMeals[index].id,
                        title: favoriteMeals[index].title,
                        imageUrl: favoriteMeals[index].imageUrl,
                        duration: favoriteMeals[index].duration,
                        complexity: favoriteMeals[index].complexity,
                        affordability: favoriteMeals[index].affordability);
                  },
                  itemCount: favoriteMeals.length,
                )
              : Text('No favorite')),
    );
  }
}
