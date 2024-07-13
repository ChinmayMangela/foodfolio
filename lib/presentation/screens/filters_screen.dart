import 'package:flutter/material.dart';
import 'package:foodfolio/presentation/providers/filter_provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Your filters'),
    );
  }

  Widget _buildBody() {
    final filterProvider = Provider.of<FilterProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildSwitchTile(
              value: filterProvider.isGlutenFree,
              title: 'Gluten-free',
              subTitle: 'only include gluten-free meals',
              onChanged: (value) {
                filterProvider.setGlutenFree(value);
              }),
          _buildSwitchTile(
              value: filterProvider.isLactoseFree,
              title: 'Lactose-free',
              subTitle: 'only include lactose-free meals',
              onChanged: (value) {
                filterProvider.setLactoseFree(value);
              }),
          _buildSwitchTile(
              value: filterProvider.isVegetarian,
              title: 'Vegetarian',
              subTitle: 'only include vegetarian meals',
              onChanged: (value) {
                filterProvider.setVegetarian(value);
              }),
          _buildSwitchTile(
              value: filterProvider.isVegan,
              title: 'Vegan',
              subTitle: 'only include vegan meals',
              onChanged: (value) {
                filterProvider.setVegan(value);
              }),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required bool value,
    required String title,
    required String subTitle,
    required void Function(bool)? onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(subTitle),
    );
  }
}
