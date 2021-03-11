import 'package:flutter/material.dart';
import '../mock_data/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal';
  final Function addFavorite;
  final Function isFavorite;
  const MealDetailScreen(this.addFavorite, this.isFavorite);

  Widget _ingredientItemBuilder(BuildContext ctx, Meal item, int index) {
    return Card(
      color: Theme.of(ctx).accentColor,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Text('${item.ingredients[index]}'),
      ),
    );
  }

  Widget _stepItemBuilder(BuildContext ctx, Meal item, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('# ${index + 1}'),
      ),
      title: Text('${item.steps[index]}'),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child,
        height: 300,
        width: 300);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == routeArgs['mealId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildContainer(ListView.builder(
            itemBuilder: (ctx, index) {
              return _ingredientItemBuilder(ctx, selectedMeal, index);
            },
            itemCount: selectedMeal.ingredients.length,
          )),
          _buildContainer(ListView.builder(
            itemBuilder: (ctx, index) {
              return Column(children: [
                _stepItemBuilder(ctx, selectedMeal, index),
                Divider()
              ]);
            },
            itemCount: selectedMeal.ingredients.length,
          ))
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(selectedMeal.id) ? Icons.star : Icons.star_border,
          color: Theme.of(context).errorColor,
        ),
        onPressed: () => addFavorite(selectedMeal.id),
      ),
    );
  }
}
