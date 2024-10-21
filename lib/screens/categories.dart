import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MealsScreen(title: "title", meals: [],),),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a category',style: TextStyle(color: Colors.white),),
      ),
      body: GridView(
        padding: EdgeInsets.all(24.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category,onselectCategory:(){
              _selectCategory(context);
            },),
        ],
      ),
    );
  }
}
