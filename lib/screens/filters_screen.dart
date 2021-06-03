import 'package:flutter/material.dart';
import 'package:meals_app/widgets.dart/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  Map<String, bool> currentFilters;

  final Function _saveFilters;

  FiltersScreen(this.currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildGlutenFree(
      String title, bool currentValue, String subtitle, Function onChanged) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: (val) => onChanged(val));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => updateFilters(),
            )
          ],
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildGlutenFree(
                    'Gluten-Free',
                    _glutenFree,
                    'Only include gluteen-free meals.',
                    (updatedVal) => setState(() {
                      _glutenFree = updatedVal;
                    }),
                  ),
                  _buildGlutenFree(
                    'Lactose-Free',
                    _lactoseFree,
                    'Only include lactose-free meals.',
                    (updatedVal) => setState(() {
                      _lactoseFree = updatedVal;
                    }),
                  ),
                  _buildGlutenFree(
                    'Vegetarian',
                    _vegetarian,
                    'Only include vegetarian meals.',
                    (updatedVal) => setState(() {
                      _vegetarian = updatedVal;
                    }),
                  ),
                  _buildGlutenFree(
                    'Vegan',
                    _vegan,
                    'Only include vegan meals.',
                    (updatedVal) => setState(() {
                      _vegan = updatedVal;
                    }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  updateFilters() {
    widget._saveFilters({
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('FIlters saved!'),
    ));
  }
}
