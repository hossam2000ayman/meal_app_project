import 'package:flutter/material.dart';
import 'package:meal_app_project/dummy_data.dart';
import 'package:meal_app_project/widgets/category_item.dart';

class Category_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => Category_Item(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(), //kedah b2et  list of widget
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
