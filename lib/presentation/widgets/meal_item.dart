import 'package:flutter/material.dart';
import 'package:foodfolio/domain/models/meal.dart';
import 'package:foodfolio/presentation/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  String get _complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get _affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 220,
            width: double.maxFinite,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: double.maxFinite,
              color: Colors.black.withOpacity(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildMealTitle(context),
                  const SizedBox(height: 5),
                  _buildDescription(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTitle(BuildContext context) {
    return Text(
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      meal.title,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MealItemTrait(
          icon: Icons.watch_later_outlined,
          text: '${meal.duration} min',
        ),
        const SizedBox(width: 12),
        MealItemTrait(
          icon: Icons.shopping_bag,
          text: _complexityText,
        ),
        const SizedBox(width: 12),
        MealItemTrait(
          icon: Icons.attach_money,
          text: _affordabilityText,
        ),
      ],
    );
  }
}
