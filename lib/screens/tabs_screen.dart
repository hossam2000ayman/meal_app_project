import 'package:flutter/material.dart';
import 'package:meal_app_project/models/meal.dart';
import 'package:meal_app_project/screens/categories_screen.dart';
import 'package:meal_app_project/screens/favorite_screen.dart';
import 'package:meal_app_project/widgets/main_drawer.dart';

class Tabs_Screen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  Tabs_Screen(this.favoriteMeal);

  @override
  State<Tabs_Screen> createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends State<Tabs_Screen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages =[
    {
      'page': Category_Screen(),
      'title': 'Categorires',
    },
    {
      'page': FavoriteScreen(widget.favoriteMeal),
      'title': 'Your Favorites',
    }
  ];
    super.initState();
  }
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
