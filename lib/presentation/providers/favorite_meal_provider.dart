import 'package:flutter/material.dart';
import 'package:foodfolio/domain/models/meal.dart';
import 'package:foodfolio/utils/helper_functions.dart';

class FavoriteMealProvider extends ChangeNotifier {
  final List<Meal> _favoriteMealsList = [];

  List get favoriteMeals => _favoriteMealsList;

  bool isFavorite(Meal meal) {
    return _favoriteMealsList.contains(meal);
  }

  void toggleMeal(Meal meal, BuildContext context) {
    if(isFavorite(meal)) {
      removeMealFromFavorites(meal);
      HelperFunctions.showSnackBar(context, 'Meal is no longer a favorite');
    } else {
      addMealToFavorites(meal);
      HelperFunctions.showSnackBar(context, 'Marked as a favorite');
    }
  }

  void addMealToFavorites(Meal meal) {
    _favoriteMealsList.add(meal);
    notifyListeners();
  }

  void removeMealFromFavorites(Meal meal) {
    _favoriteMealsList.remove(meal);
    notifyListeners();
  }
}