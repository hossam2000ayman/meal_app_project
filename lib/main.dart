import 'package:flutter/material.dart';
import 'package:meal_app_project/dummy_data.dart';
import 'package:meal_app_project/models/meal.dart';
import 'package:meal_app_project/screens/filter_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avaliableMeal = DUMMY_MEALS;
  List<Meal> _favoritesMeal = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avaliableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false; //delete it
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false; //delete it
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false; //delete it
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false; //delete it
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritesMeal.indexWhere((meal) => meal.id == mealId);
    //if it appear so it print a specific index so delete it
    //otherwise it return -1 and not delete it
    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritesMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => Tabs_Screen(_favoritesMeal),
        Category_Meals_Screen.routeName: (context) =>
            Category_Meals_Screen(_avaliableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
            ),
      ),
    );
  }
}
