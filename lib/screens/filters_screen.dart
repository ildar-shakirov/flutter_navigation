import 'package:flutter/material.dart';
import 'package:navigation/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen({Key key, this.saveFilters, this.currentFilters})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSitchListTile(
      String title, String subtitle, Function handleChange, bool value) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: handleChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };

                widget.saveFilters(filters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSitchListTile(
                    'Gluten-free', 'Only include gluteen-free meals',
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }, _glutenFree),
                _buildSitchListTile(
                    'Lactose-free', 'Only include lactose-free meals',
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }, _lactoseFree),
                _buildSitchListTile(
                    'Vegeterian', 'Only include vegeterian meals', (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                }, _vegeterian),
                _buildSitchListTile('Vegan', 'Only include vegan meals',
                    (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }, _vegan),
              ],
            ),
          )
        ],
      ),
    );
  }
}
