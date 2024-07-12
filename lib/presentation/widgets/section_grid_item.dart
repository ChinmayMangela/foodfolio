import 'package:flutter/material.dart';
import 'package:foodfolio/domain/models/section.dart';
import 'package:foodfolio/presentation/screens/meals.dart';

class SectionGridItem extends StatelessWidget {
  const SectionGridItem({
    super.key,
    required this.section,
  });

  final Section section;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Meals(section: section),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: _getGradientColors(),
            )),
        child: Text(
          section.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors() {
    return [
      section.color.withOpacity(0.7),
      section.color.withOpacity(0.4),
    ];
  }
}
