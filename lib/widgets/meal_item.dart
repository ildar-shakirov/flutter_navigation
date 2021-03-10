import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  const MealItem(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challenging:
        return 'challenging';
      case Complexity.Hard:
        return 'hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
      case Affordability.Pricey:
        return 'pricey';
      case Affordability.Luxurious:
        return 'luxurious';
      default:
        return 'unknown';
    }
  }

  // const MealItem({Key key}) : super(key: key);
  void selectMeal(ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: {'mealId': id});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () => selectMeal(context),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(width: 6),
                            Text('${duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(width: 6),
                            Text('${complexityText} min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.money),
                            SizedBox(width: 6),
                            Text('${affordabilityText} \$'),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
