import 'package:flutter/material.dart';
import 'package:meal_app_project/dummy_data.dart';
import 'package:meal_app_project/models/meal.dart';
import 'package:meal_app_project/widgets/meal_item.dart';

class Category_Meals_Screen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> _avaliableMeals;

  const Category_Meals_Screen(this._avaliableMeals);
  @override
  State<Category_Meals_Screen> createState() => _Category_Meals_ScreenState();
}

class _Category_Meals_ScreenState extends State<Category_Meals_Screen> {
  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    //lo 3ayz 2a8ayar state we 2anafez el data 2bl lma 23ml build lel widget
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id']; //can reach it with key
    categoryTitle = routeArg['title'];
    displayMeals = widget._avaliableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // list of widget        //constraints
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
