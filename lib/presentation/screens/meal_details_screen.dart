import 'package:flutter/material.dart';
import 'package:foodfolio/domain/models/meal.dart';
import 'package:foodfolio/presentation/providers/favorite_meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        meal.title,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        Consumer<FavoriteMealProvider>(
          builder: (context, favoriteMealProvider, _) {
            bool isFavorite = favoriteMealProvider.isFavorite(meal);
            return IconButton(
              onPressed: () {
                favoriteMealProvider.toggleMeal(meal, context);
              },
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_outline,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMealPoster(),
          const SizedBox(height: 10),
          _buildSectionTitle(context, 'Ingredients'),
          const SizedBox(height: 10),
          _buildIngredientsList(context),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Steps'),
          const SizedBox(height: 10),
          _buildStepsList(context),
        ],
      ),
    );
  }

  Widget _buildMealPoster() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 250,
      width: double.infinity,
      child: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final titleStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.primaryContainer,
      fontWeight: FontWeight.bold,
    );
    return Text(
      title,
      style: titleStyle,
    );
  }

  Widget _buildIngredientsList(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: meal.ingredients.map((ingredient) => Text(ingredient, style: bodyStyle,)).toList(),
    );
  }


  Widget _buildStepsList(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: meal.steps.asMap().entries.map((entry) {
        int index = entry.key;
        String step = entry.value;
        return Text(
          '${index + 1})  $step\n',
          style: bodyStyle,
        );
      }).toList(),
    );
  }

}
