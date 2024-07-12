import 'package:flutter/material.dart';
import 'package:foodfolio/presentation/screens/favorite_meals_screen.dart';
import 'package:foodfolio/presentation/screens/filters_screen.dart';
import 'package:foodfolio/presentation/screens/section_screen.dart';
import 'package:foodfolio/presentation/widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void _onSelectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const SectionScreen();
    String activePageTitle = 'Sections';
    if(selectedPageIndex == 1) {
      activePage = const FavoriteMealsScreen();
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: _buildAppbar(activePageTitle),
      drawer: MyDrawer(
      ),
      body: _buildBody(activePage),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  AppBar _buildAppbar(String title) {
    return AppBar(
      title: Text(title),
    );
  }

  Widget _buildBody(Widget activePage) {
    return activePage;
  }

  Widget _buildBottomNavbar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: selectedPageIndex,
      onTap: _onSelectPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(selectedPageIndex == 0
              ? Icons.category
              : Icons.category_outlined),
          label: 'Sections',
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedPageIndex == 1 ? Icons.star : Icons.star_outline),
          label: 'Favorites',
        ),
      ],
    );
  }
}
