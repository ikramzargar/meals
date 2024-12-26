import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen({super.key, required this.meal,required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(onPressed: (){
              onToggleFavorite(meal);
            }, icon: Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.0,),
              for (final ingredient in meal.ingredients)
                Text(ingredient,style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface,),
                ),
              SizedBox(height: 24.0,),
              Text(
                'Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.0,),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                  child: Text(step,textAlign: TextAlign.center,style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface,),
                  ),
                ),
          
            ],
          ),
        ));
  }
}
