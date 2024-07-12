import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildSwitchTile(
            value: _isGlutenFree,
            title: 'Gluten-free',
            subTitle: 'only include gluten-free meals',
            onChanged: (value) => setState(() => _isGlutenFree = value),
          ),
          _buildSwitchTile(
            value: _isLactoseFree,
            title: 'Lactose-free',
            subTitle: 'only include lactose-free meals',
            onChanged: (value) => setState(() => _isLactoseFree = value),
          ),
          _buildSwitchTile(
            value: _isVegetarian,
            title: 'Vegetarian',
            subTitle: 'only include vegetarian meals',
            onChanged: (value) => setState(() => _isVegetarian = value),
          ),
          _buildSwitchTile(
              value: _isVegan,
              title: 'Vegan',
              subTitle: 'only include vegan meals',
              onChanged: (value) => setState(() => _isVegan = value))
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
