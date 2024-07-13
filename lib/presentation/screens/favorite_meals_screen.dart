import 'package:flutter/material.dart';
import 'package:foodfolio/presentation/providers/favorite_meal_provider.dart';
import 'package:foodfolio/presentation/screens/meal_details_screen.dart';
import 'package:foodfolio/presentation/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoriteMealsScreen extends StatelessWidget {
  const FavoriteMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final favoriteMealProvider = Provider.of<FavoriteMealProvider>(context);
    return favoriteMealProvider.favoriteMeals.isEmpty
        ? _buildEmptyFavoritesMessage(context)
        : _buildListOfFavoriteMeals(favoriteMealProvider);
  }

  Widget _buildListOfFavoriteMeals(FavoriteMealProvider favoriteMealProvider) {
    return ListView.builder(
        itemCount: favoriteMealProvider.favoriteMeals.length,
        itemBuilder: (context, index) {
          final currentMeal = favoriteMealProvider.favoriteMeals[index];
          return InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(
                  meal: currentMeal,
                ),
              ),
            ),
            child: MealItem(
              meal: currentMeal,
            ),
          );
        });
  }

  Widget _buildEmptyFavoritesMessage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Uh...no nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            'Try selecting a different section!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
