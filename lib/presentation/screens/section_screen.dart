import 'package:flutter/material.dart';
import 'package:foodfolio/data/dummy_data.dart';
import 'package:foodfolio/presentation/widgets/section_grid_item.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: dummyMeals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 0.7,
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        return SectionGridItem(
          section: availableSections[index],
        );
      },
    );
  }
}
