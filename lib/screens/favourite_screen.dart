import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets.dart/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  List<Meal> _favouriteMeals;
  FavouriteScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _favouriteMeals.length,
        itemBuilder: (ctx, index) {
          final meal = _favouriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        });
  }
}
