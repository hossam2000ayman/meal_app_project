import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

//enum is important in storing a group of constants values
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
  });
}

// Meal m1 = Meal(
//   id: null,
//   categories: null,
//   title: null,
//   imageUrl: null,
//   ingredients: null,
//   steps: null,
//   duration: null,
//   complexity: Complexity.Challenging,
//   affordability: Affordability.Affordable,
//   isGlutenFree: null,
//   isVegan: null,
//   isVegetarian: null,
// );
