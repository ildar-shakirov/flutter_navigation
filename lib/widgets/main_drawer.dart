import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget listTileBuilder(Icon icon, String title, Function handleTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      onTap: handleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            listTileBuilder(Icon(Icons.restaurant, size: 26), 'Meals', () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            listTileBuilder(Icon(Icons.settings, size: 26), 'Filters', () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
