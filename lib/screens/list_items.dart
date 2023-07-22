// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_ordering/widgets/cuisine_Item.dart';
import '../model/cuisine.dart';
import '../model/dish.dart';
import '../widgets/dish_item.dart';

class ListItems extends StatelessWidget {
  const ListItems(
      {super.key,
      required this.FilteredListDishes,
      required this.FilteredListCuisines});
  final List<Dish> FilteredListDishes;
  final List<Cuisine>? FilteredListCuisines;

  List<Dish> FilterAccordingCuisine(Cuisine SelectedCuisine) {
    final cuisineDishes = FilteredListDishes.where(
        (element) => element.cuisine == SelectedCuisine).toList();
    return cuisineDishes;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("Opps No Dishes Here .."));
    var isCuisneBuilder;
    if (FilteredListCuisines != null) {
      isCuisneBuilder = true;
    } else {
      isCuisneBuilder = false;
    }

    if (isCuisneBuilder) {
      content = ListView.builder(
        itemCount: FilteredListCuisines!.length,
        itemBuilder: (context, index) {
          return CuisineItem(
            cuisine: FilteredListCuisines![index],
            ListDishes: FilterAccordingCuisine(FilteredListCuisines![index]),
          );
        },
      );
    } else {
      content = ListView.builder(
          itemCount: FilteredListDishes.length,
          itemBuilder: (context, index) {
            return DishItem(meal: FilteredListDishes[index]);
          });
    }
    return Scaffold(
      appBar:
          AppBar(title: isCuisneBuilder ? Text("Cuisines") : Text("Dishes")),
      body: content,
    );
  }
}
