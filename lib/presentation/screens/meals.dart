import 'package:flutter/material.dart';
import 'package:foodfolio/data/dummy_data.dart';
import 'package:foodfolio/domain/models/meal.dart';
import 'package:foodfolio/presentation/providers/filter_provider.dart';
import 'package:foodfolio/presentation/screens/meal_details_screen.dart';
import 'package:foodfolio/presentation/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import '../../domain/models/section.dart';

class Meals extends StatelessWidget {
  const Meals({
    super.key,
    required this.section,
  });

  final Section section;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FilterProvider>(context, listen: false);
    final filteredMeals = dummyMeals.where(
      (meal) {
        if (filtersProvider.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (filtersProvider.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (filtersProvider.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        if (filtersProvider.isVegan && !meal.isVegan) {
          return false;
        }
        return meal.sections.contains(section.id);
      },
    ).toList();

    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(filteredMeals, context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(section.title),
    );
  }

  Widget _buildBody(List<Meal> filteredMeals, BuildContext context) {
    return filteredMeals.isEmpty
        ? _buildEmptyMealsMessage(context)
        : _buildMealsList(filteredMeals);
  }

  Widget _buildMealsList(List<Meal> filteredMeals) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: filteredMeals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
          child: InkWell(
            onTap: () {
              selectMeal(filteredMeals[index], context);
            },
            child: MealItem(
              meal: filteredMeals[index],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyMealsMessage(BuildContext context) {
    return Center(
      child: Text(
        'No meals Found',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
